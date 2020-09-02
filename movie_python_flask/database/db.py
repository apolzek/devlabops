from flask_mongoengine import MongoEngine

db = MongoEngine()


def initialize_db(app):
    db.init_app(app)
    # HOST = 'localhost'
    # PORT = 27017
    # throw_if_mongodb_is_unavailable(HOST, PORT)
    # import pymongo
    # conn = pymongo.MongoClient(HOST, PORT)
    # print(conn.admin.command('ismaster'))


def throw_if_mongodb_is_unavailable(host, port):
    import socket
    sock = None
    try:
        sock = socket.create_connection(
            (host, port),
            timeout=1)  # one second
    except socket.error as err:
        raise EnvironmentError(
            "Can't connect to MongoDB at {host}:{port} because: {err}"
            .format(**locals()))
    finally:
        if sock is not None:
            sock.close()
