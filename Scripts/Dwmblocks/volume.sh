#!/bin/bash

# Verifica o comando passado (aumentar, diminuir, mutar ou exibir)
case "$1" in
    up)
        # Aumenta o volume em 5%
        amixer set Master 5%+ > /dev/null
        ;;
    down)
        # Diminui o volume em 5%
        amixer set Master 5%- > /dev/null
        ;;
    mute)
        # Alterna o mute
        amixer set Master toggle > /dev/null
        ;;
    *)
        # Exibe o volume atual
        VOL="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
        echo "$VOL%"  # Exibe o volume no formato desejado
        ;;
esac
