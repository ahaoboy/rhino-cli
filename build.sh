if [ $# -ne 1 ]; then
    echo "not found target"
    exit 1
fi

TARGET=$1

jpackage --name rhino --input ./  --main-jar rhino-all-1.8.0.jar   --main-class org.mozilla.javascript.tools.shell.Main   --runtime-image $JAVA_HOME  --type app-image


tar -czf ./rhino-${TARGET}.tar.gz -C rhino .
ls -l ./rhino-${TARGET}.tar.gz