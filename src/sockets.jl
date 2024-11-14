using Sockets

server = listen(9090)
while true
    connection = accept(server)
    # coroutine
    @async begin
        try
            while true
                line = readline(connection)
                println(line)
                if chomp(line) == "S"
                    println("Stopping TCP server...")
                    close(connection)
                    exit(0)
                else
                    write(connection, line)
                    write(connection, "\n")
                end
            end
        catch ex
            print("Connection lost with error $ex")
            clone(connection)
        end
    end
end