if [ $# -ne 1 ]; then
    echo "not found target"
    exit 1
fi

TARGET=$1

RHINO_DIR="rhino"
RHINO_JAR="rhino-all-1.8.1-20250614.122300-24.jar"

case "$(uname)" in
  Darwin*)
    RHINO_DIR="rhino.app"
    ;;
esac

PLATFORM=$(uname)

if [[ "$PLATFORM" == "Darwin" ]] || [[ "$PLATFORM" == "Linux" ]]; then
  jpackage --name rhino --input ./jar --main-jar $RHINO_JAR --main-class org.mozilla.javascript.tools.shell.Main --type app-image
else
  jpackage --name rhino --input ./jar --main-jar $RHINO_JAR --main-class org.mozilla.javascript.tools.shell.Main --type app-image --win-console
fi

ls -l $RHINO_DIR

date > $RHINO_DIR/BUILD_TIME.txt

tar -czf ./rhino-${TARGET}.tar.gz -C $RHINO_DIR .
ls -l ./rhino-${TARGET}.tar.gz