#!/bin/bash

# Página de carregamento
LOADING_PAGE="/opt/sismar_sensores/startup.html"

# URL para verificar o status de saúde
HEALTH_CHECK_URL="http://localhost:5000/actuator/health"

# URL para abrir quando o status estiver UP
TARGET_URL="http://localhost:5000"

# Abrir a página de carregamento no navegador padrão
firefox "$LOADING_PAGE" &

# Verificar status de saúde
(
    while true; do
        # Fazer a requisição HTTP e capturar o status
        STATUS=$(curl -s "$HEALTH_CHECK_URL" | jq -r '.status')

        # Se o status for UP, fechar o Firefox de forma segura e abrir a página de destino
        if [ "$STATUS" == "UP" ]; then
            # Fechar o Firefox de forma segura
            pkill -f firefox

            # Aguardar o Firefox fechar completamente
            sleep 1

            # Abrir o Firefox com a página de destino, sem restaurar abas
            firefox --new-instance --new-window "$TARGET_URL"
            break
        fi

        # Aguardar 2 segundos antes da próxima verificação
        sleep 2
    done
) & disown