# Run a program and terminate it after timeout second
# Timeout.
timeout=3
# Interval between checks if the process is still alive.
interval=1
# Delay between posting the SIGTERM signal and destroying the process by SIGKILL.
delay=1

# kill -0 pid   Exit code indicates if a signal may be sent to $pid process.
(
    t=$timeout

    while [ $t -gt 0 ]; do
        sleep $interval
        t="$(($t-$interval))"
        echo $t
    done

    # Be nice, post SIGTERM first.
    # The 'exit 0' below will be executed if any preceeding command fails.
    kill -SIGTERM $$ && kill -0 $$ || exit 0
    sleep $delay
    kill -SIGKILL $$
) &

exec "$@"