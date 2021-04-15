#/bin/bash

echo ""
echo "Clean-up all for new demonstration ..."
echo ""

ls -laR /opt/devops-labs-share/


rm /opt/devops-labs-share/environment/prod/*
rm /opt/devops-labs-share/environment/tu/*
rm /opt/devops-labs-share/environment/ti/*
rm /opt/devops-labs-share/package-release/*
