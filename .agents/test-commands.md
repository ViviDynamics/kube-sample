# Test commands

Run by `preflight` before every push. A row runs only when the branch's diff touches
its paths; rows run top to bottom and stop at the first failure.

This repository has no test suite, linter, or build pipeline. The only verifying
command it ships is the hello-go image build, which needs Docker. The Kubernetes
manifests and `setup.sh` / `teardown.sh` act on a live cluster and are not run here.

| Area | Paths | Command |
| --- | --- | --- |
| hello-go image | hello-go/Dockerfile, hello-go/build.sh, hello-go/cmd/* | cd hello-go && ./build.sh |
