##############
# JAVA #
##############

# export JAVA_HOME="$(/usr/libexec/java_home)"
# export IDEA_JDK="1.8*"

asdf_update_java_home() {
  local current
  if current=$(asdf current java); then
    local version=$(echo $current | cut -d ' ' -f 1)
    export JAVA_HOME=$(asdf where java $version)
  else
    echo "No java version set. Type `asdf list-all java` for all versions."
  fi
}
asdf_update_java_home
