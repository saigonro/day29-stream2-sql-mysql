from flask import Flask, render_template, request, abort
import pymysql
import os

app = Flask(__name__)

username = os.environ.get("C9_USER")

def do_select(sql):
    
    # Connect to the database
    connection = pymysql.connect(host='localhost',
                                 user=username,
                                 password='',
                                 db='Chinook')

    try:
        with connection.cursor(pymysql.cursors.DictCursor) as cursor:
            cursor.execute(sql)
            return cursor.fetchall()

    finally:
        connection.close()

@app.route('/')
def get_index():
    return "Welcome"

@app.route('/artists')
def get_artists():
    return render_template("artists.html", artists=do_select("select * from Artist"))

@app.route('/artists/add')
def add_artist():
    return render_template("add_artist.html")

@app.route('/albums')
def get_albums():
    return render_template("albums.html", albums=do_select("select * from Album"))
    
@app.route('/albums/<id>')
def get_album_details(id):
    
    sql = "select * from Album where AlbumId = {0}".format(id)
    album_details = do_select(sql)
    
    if (len(album_details) == 0):
        # return render_template('404.html'), 404
        return abort(404)
    else:
        album_details = album_details
    
    sql = "select * from Track where AlbumId = {0}".format(id)
    track_list = do_select(sql)

    return render_template("album_details.html", album=album_details, tracks=track_list)

@app.route('/search')
def do_serch():
    q = request.args.get('query')
    sql = "select * from Album where Title like '%{0}%'".format(q)
    return render_template("albums.html", albums=do_select(sql))

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)