if [ $# -ne 1 ]; then
    echo "not found target"
    exit 1
fi

TARGET=$1

RHINO_DIR="rhino"

case "$(uname)" in
  Darwin*)
    RHINO_DIR="rhino.app"
    ;;
esac

# jpackage --name rhino --input ./  --main-jar rhino-all-1.8.0.jar --main-class org.mozilla.javascript.tools.shell.Main   --runtime-image $JAVA_HOME  --type app-image
PLATFORM=$(uname)

if [[ "$PLATFORM" == "Darwin" ]] || [[ "$PLATFORM" == "Linux" ]]; then
  jpackage --name rhino --input ./jar --main-jar rhino-all-1.8.0.jar --main-class org.mozilla.javascript.tools.shell.Main --type app-image
else
  jpackage --name rhino --input ./jar --main-jar rhino-all-1.8.0.jar --main-class org.mozilla.javascript.tools.shell.Main --type app-image --win-console
fi

ls -l $RHINO_DIR

tar -czf ./rhino-${TARGET}.tar.gz -C $RHINO_DIR .
ls -l ./rhino-${TARGET}.tar.gz