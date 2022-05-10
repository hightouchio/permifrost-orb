if [ "${DRY_RUN}" == "true" ]; then
  set -- "$@" --dry
fi

if [ "${DIFF}" == "true" ]; then
  set -- "$@" --diff
fi

if [ -n "${ROLE}" ]; then
  set -- "$@" --role "${ROLE}"
fi

if [ -n "${USER}" ]; then
  set -- "$@" --user "${USER}"
fi

if [ "${IGNORE_MEMBERSHIPS}" == "true" ]; then
  set -- "$@" --ignore-memberships
fi

if [ -n "${SPEC_PATH}" ]; then
  set -- "$@" ${SPEC_PATH}
fi

if [ -n "${VERBOSE}" ]; then
    permifrost -vv run "$@"
else
    permifrost run "$@"
fi

