from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship

# Replace 'mysql://username:password@localhost/db_name' with your MySQL connection string
engine = create_engine('mysql://username:password@localhost/db_name')
Base = declarative_base()

# Define User table
class User(Base):
    __tablename__ = 'users'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    age = Column(Integer)

# Define Post table
class Post(Base):
    __tablename__ = 'posts'

    id = Column(Integer, primary_key=True)
    title = Column(String)
    content = Column(String)
    user_id = Column(Integer, ForeignKey('users.id'))
    user = relationship("User", back_populates="posts")

User.posts = relationship("Post", order_by=Post.id, back_populates="user")

# Create tables in the database
Base.metadata.create_all(engine)

# Create a session
Session = sessionmaker(bind=engine)
session = Session()

# Add some sample data
user1 = User(name='Alice', age=30)
user2 = User(name='Bob', age=25)
session.add_all([user1, user2])
session.commit()

post1 = Post(title='First Post', content='This is the content of the first post.', user=user1)
post2 = Post(title='Second Post', content='This is the content of the second post.', user=user1)
session.add_all([post1, post2])
session.commit()

# Queries
# Query all users
users = session.query(User).all()
print("All Users:")
for user in users:
    print(f"ID: {user.id}, Name: {user.name}, Age: {user.age}")

# SQL query for querying all users
"""
SELECT * FROM users;
"""

# Query all posts
posts = session.query(Post).all()
print("\nAll Posts:")
for post in posts:
    print(f"ID: {post.id}, Title: {post.title}, Content: {post.content}, User: {post.user.name}")

# SQL query for querying all posts
"""
SELECT * FROM posts;
"""

# Close the session
session.close()

# SQL queries for creating tables:
"""
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    age INT
);

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    content TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
"""
