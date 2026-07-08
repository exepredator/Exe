#!bin/bash
WHITE='\033[1;37m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m'
echo -e "${GREEN}─── ⋆⋅☆⋅⋆ ── Predator_Basic_Toolbox v2.0 ─── ⋆⋅☆⋅⋆ ───${NC}"
echo -e "${BLUE}=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»${NC}"
echo -e "${WHITE}{1} Update & Upgrade termux${NC}"
echo -e "${WHITE}{2} Clean termux cache${NC}"
echo -e "${WHITE}{3} Delete all packages${NC}"
echo -e "${WHITE}{4} Termux change repo${NC}"
echo -e "${WHITE}{5} Auto-Fix Corrupted Packages (Fix DPKG Error)${NC}"
echo -e "${WHITE}{6} Enable Termux Extra Keys Keyboard${NC}"
echo -e "${WHITE}{7} Termux-setup-storage${NC}"
echo -e "${WHITE}{8} Exit${NC}"
echo -e "${BLUE}=»=»=»=»=»=»==»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»=»${NC}"
echo -e -n "${GREEN}Enter the number ="
read choise

if [ "$choise" == "1" ]; then
     echo -e "${WHITE}updating packages lists ....${NC}"
     pkg update -y
     echo -e "${WHITE}upgrading packages ....${NC}"
     pkg upgrade -y
     echo -e "${GREEN}✓ Done${NC}"

elif [ "$choise" == "2" ]; then
     echo -e "${WHITE}Cleaning termux cache ....${NC}"
     apt-get clean
     pkg clean
     rm -rf $PREFIX/tmp/*
     rm -rf ~/.cache/*
     echo -e "${GREEN}✓ All junk files and cache cleared successfully!${NC}"

elif [ "$choise" == "3" ]; then
     echo -e "${WHITE}Delete all packages and tools on termux${NC}"
     pkg wipe
     echo -e "${GREEN}✓ Done${NC}"

elif [ "$choise" == "4" ]; then
     termux-change-repo
     echo -e "${GREEN}✓ Done${NC}"

elif [ "$choise" == "5" ] ; then
     echo -e "${WHITE}Fixing the persistent Termux errors${NC}"
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
