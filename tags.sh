BASEDIR=$(dirname $0)
cd $BASEDIR
find . -name "*.el" -print | xargs etags -a
