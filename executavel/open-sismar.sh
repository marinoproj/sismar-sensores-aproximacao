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

        # Se o status for UP, abrir a página de destino na mesma aba e sair
        if [ "$STATUS" == "UP" ]; then
            firefox --new-tab "$TARGET_URL"
            break
        fi

        # Aguardar 2 segundos antes da próxima verificação
        sleep 2
    done
) & disown