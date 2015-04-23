#!/bin/bash
#
# fuseki:          Startup script for Fuseki.
#
# chkconfig: 3 80 05
# description:      Startup script for Fuseki.

FUSEKI_HOME=/opt/fuseki;
export FUSEKI_HOME

start() {
        echo "Starting fuseki..."
        cd $FUSEKI_HOME
        ./fuseki-server --config=doacc.ttl --localhost 2>&1 &
        echo $! &> /tmp/fuseki.pid
        sleep 2
        echo "done."
}

stop() {
        echo "Stopping fuseki..."
        cat /tmp/fuseki.pid | xargs -i kill -9 {}
        echo "done"
}

# See how we were called.
case "$1" in
        start)
                start
                ;;
        stop)
                stop
                ;;
        restart)
                stop
                start
                ;;
        *)
                echo $"Usage: fuseki {start|stop|restart}"
                exit
esac