function _fs_install --on-event fs_install
    # Set universal variables, create bindings, and other initialization logic.
    echo "You've just installed fs. See usage on:"
    echo "https://github.com/yngvark/fs"
end

function _fs_update --on-event fs_update
    # Migrate resources, print warnings, and other update logic.
end

function _fs_uninstall --on-event fs_uninstall
    # Erase "private" functions, variables, bindings, and other uninstall logic.
end
