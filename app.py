import streamlit as st

# Serve your existing HTML file
with open("build/index.html", "r", encoding="utf-8") as f:
    html_content = f.read()

st.components.v1.html(html_content, height=600, scrolling=True)
