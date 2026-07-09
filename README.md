#!bin/bash
echo -e "${RED}"
figlet -f slant "Predator"
echo -e "${NC}"
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
NC='\033[0m'
clear
while true; do
echo -e "${GREEN}─── ⋆⋅☆⋅⋆ ── Predator_Basic_Toolbox v2.0 ─── ⋆⋅☆⋅⋆ ───${NC}"
echo -e "${YELLOW}=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»${NC}"
echo -e "${GREEN}{1} Update & Upgrade termux${NC}"
echo -e "${GREEN}{2} Clean termux cache${NC}"
echo -e "${GREEN}{3} Delete all packages${NC}"
echo -e "${GREEN}{4} Termux change repo${NC}"
echo -e "${GREEN}{5} Auto-Fix Corrupted Packages (Fix DPKG Error)${NC}"
echo -e "${GREEN}{6} Enable Termux Extra Keys Keyboard${NC}"
echo -e "${GREEN}{7} Termux-setup-storage${NC}"
echo -e "${GREEN}{8} Exit${NC}"
echo -e "${YELLOW}=»=»=»=»=»=»==»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»${NC}"
echo -e -n "${GREEN}Enter the number ="
read choise

if [ "$choise" == "1" ]; then
     pkg update -y
     pkg upgrade -y
     echo -e "${GREEN}✓ Done${NC}"

elif [ "$choise" == "2" ]; then
     apt-get clean
     pkg clean
     rm -rf $PREFIX/tmp/*
     rm -rf ~/.cache/*
     echo -e "${GREEN}✓ All junk files and cache cleared successfully!${NC}"
/
elif [ "$choise" == "3" ]; then
     pkg wipe
     echo -e "${GREEN}✓ Done${NC}"

elif [ "$choise" == "4" ]; then
     termux-change-repo
     echo -e "${GREEN}✓ Done${NC}"

elif [ "$choise" == "5" ] ; then
     dpkg --configure -a
     apt-get install -f -y
     echo -e "${GREEN}✓ Package manager fixed and ready!${NC}"

elif [ "$choise" == "6" ]; then
     mkdir -p ~/.termux
     echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" > ~/.termux/termux.properties
     termux-reload-settings
     echo -e "${GREEN}✓ Extra keys enabled successfully!${NC}"

elif [ "$choise" == "7" ]; then
     termux-setup-storage

elif ["$choise" == "8" ]; then
     exit
fi

done
