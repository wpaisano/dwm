#!/bin/sh

# Configuração dos monitores com xrandr
xrandr --output LVDS-1 --mode 1366x768 --pos 0x0 --rotate normal  # Monitor integrado (notebook), resolução 1366x768, posição à esquerda
xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1366x0 --rotate normal  # Monitor externo conectado na saída HDMI, resolução 1920x1080, principal e à direita do integrado
xrandr --output VGA-1 --off  # Desativa a saída VGA
xrandr --output DP-1 --off  # Desativa a saída DisplayPort

# Inicia o dwmblocks para exibição de informações na barra do dwm
dwmblocks &

# Restaura o papel de parede com o Nitrogen (preenchimento ajustado e escolha aleatória de imagem)
#nitrogen --random --set-zoom-fill /home/glover/Imagens/Wallpapers/ &

# Define o papel de parede para ambos os monitores em zoom-fill
nitrogen --random --set-zoom-fill --head=LVDS-1 /home/glover/Imagens/Wallpapers/ &
nitrogen --random --set-zoom-fill --head=HDMI-1 /home/glover/Imagens/Wallpapers/ &

# Configura o layout do teclado para ABNT2 (br) e US, alternando com Alt+Shift
setxkbmap -layout br,us -option "grp:alt_shift_toggle" &

# Ativa o Num Lock automaticamente
numlockx on &

# Inicia o agente de autenticação do polkit para permissões administrativas
polkit-xfce-authentication-agent-1 &

# Configura a taxa de repetição do teclado (300ms de atraso, 50 repetições por segundo)
xset r rate 300 50 &

# Desativa o protetor de tela
xset s off &

# Desativa o gerenciamento de energia da tela (DPMS)
xset -dpms &

# Inicia o applet do NetworkManager para gerenciar conexões de rede
nm-applet &

# Inicia o Picom para efeitos de composição (transparência, sombras, etc.)
picom &
