from KomiRobot import DB_URL
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import scoped_session, sessionmaker


def start() -> scoped_session:
    engine = create_engine(DB_URL, client_encoding="utf8")
    BASE.metadata.bind = engine
    BASE.metadata.create_all(engine)
    return scoped_session(sessionmaker(bind=engine, autoflush=True))
from dotenv import load_dotenv
load_dotenv()
import os
import MySQLdb

connection = MySQLdb.connect(
  host="aws.connect.psdb.cloud",
  user="fjhmmx7pe6dcla2966km",
  passwd= "pscale_pw_q0pipgN1eW0hTkvX3Lts3IljZ3vFuV7DAKc8FBamZyc",
  db= "komi",
  autocommit = True,
  ssl_mode = "VERIFY_IDENTITY",
  ssl      = {
    "ca": "/etc/ssl/cert.pem"
  }
)

BASE = declarative_base()
SESSION = connection
