(append
    (list
        (channel
            (name 'ouranos)
            (url "https://gitlab.inria.fr/jvanhare/ouranos")
            (branch "develop"))
        (channel
            (name 'guix-hpc)
            (url "https://gitlab.inria.fr/guix-hpc/guix-hpc.git")))
    %default-channels)
