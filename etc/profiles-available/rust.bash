if [[ -d ~/.multirust ]]; then
    DEFAULT=$(cat ~/.multirust/default)
    add_path ~/.multirust/toolchains/$DEFAULT/share/man MANPATH
else
    add_path ~/opt/rust/bin
    add_path ~/opt/rust/share/man MANPATH
    add_path ~/opt/rust/lib LD_LIBRARY_PATH
fi
