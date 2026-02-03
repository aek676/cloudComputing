resource "kubernetes_config_map" "fluentd_config" {
  metadata {
    name = "fluentd-config"
  }

  data = {
    "fluent.conf" = <<-EOF
      <source>
          @type tail
          format none
          path /var/log/app.log
          pos_file /var/log/app.log.pos
          tag count.format1
      </source>

      <match **>
          @type elasticsearch
          host ${google_compute_instance.vm[0].network_interface[0].network_ip}
          port 9200
          user ${var.elasticsearch_user}
          password ${var.elasticsearch_password}
          logstash_format true
      </match>
    EOF
  }

  depends_on = [google_container_cluster.gke_autopilot]
}

resource "kubernetes_pod" "multi_container_pod" {
  metadata {
    name = "multi-container-pod"
  }

  spec {
    container {
      name  = "cite-generator"
      image = "yauritux/busybox-curl"

      command = ["/bin/sh", "-c"]
      args = [
        <<-EOF
        while true; do
          frase=$(curl -s https://dummyjson.com/quotes/random)
          echo $frase | grep -o '"quote":"[^"]*' | grep -o '[^"]*$' >> /var/log/app.log;
          sleep 30;
        done
        EOF
      ]

      resources {
        requests = {
          memory = "128Mi"
          cpu    = "100m"
        }
        limits = {
          memory = "256Mi"
          cpu    = "250m"
        }
      }

      volume_mount {
        name       = "varlog"
        mount_path = "/var/log"
      }
    }

    container {
      name  = "fluentd"
      image = "fluent/fluentd-kubernetes-daemonset:v1-debian-elasticsearch"

      env {
        name  = "FLUENT_ELASTICSEARCH_HOST"
        value = google_compute_instance.vm[0].network_interface[0].network_ip
      }
      env {
        name  = "FLUENT_ELASTICSEARCH_PORT"
        value = "9200"
      }
      env {
        name  = "FLUENT_ELASTICSEARCH_SCHEME"
        value = "http"
      }
      env {
        name  = "FLUENT_ELASTICSEARCH_USER"
        value = var.elasticsearch_user
      }
      env {
        name  = "FLUENT_ELASTICSEARCH_PASSWORD"
        value = var.elasticsearch_password
      }
      env {
        name  = "FLUENT_UID"
        value = "0"
      }

      resources {
        requests = {
          memory = "200Mi"
          cpu    = "200m"
        }
        limits = {
          memory = "512Mi"
          cpu    = "500m"
        }
      }

      volume_mount {
        name       = "varlog"
        mount_path = "/var/log"
      }

      volume_mount {
        name       = "config-volume"
        mount_path = "/fluentd/etc"
      }
    }

    volume {
      name = "varlog"
      empty_dir {}
    }

    volume {
      name = "config-volume"
      config_map {
        name = kubernetes_config_map.fluentd_config.metadata[0].name
      }
    }
  }

  depends_on = [
    google_container_cluster.gke_autopilot,
    kubernetes_config_map.fluentd_config
  ]
}
