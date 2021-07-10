# To Run this on browser type on temrinal: streamlit run app.py

import streamlit as st

# Text/Title
st.title("Streamlit Tutorials")

# Header/Subheader
st.header("This is a header")
st.subheader("This is a subheader")

# Text
st.text("Hello streamlit")

# Markdown
st.markdown("### This is a Markdown")

# Error/Colorful Text
st.success("Successful")
st.info("Information!")
st.warning("This is a warning!")
st.error("This is an error. Danger!")
st.exception("NameError('name three not defined')")

# Get Help Info About Python
st.help(range)

# Writing Text
st.write("Text with write")
st.write(range(10))

# Images
from PIL import Image
#img = Image.open("example.jpeg") # this file must be inside the Streamlit folder directory!
#st.image(img, width=300,caption="Simple Image")

# Videos
# vid_file = open("example.mp4","rb")
# vide_bytes = vid_file.read()
# st.video(vid_file)

# Audio
# audio_file = opne("examplemusic.mp3","rb").read()
# st.audio(audio_file, format='audio/mp3')

# Widget
# Checkbox
if st.checkbox("Show/Hide"):
	st.text("Showing or Hiding Widget")

# Radio Buttons
status = st.radio("What is your status", ("Active","Inactive"))

if status == 'Active':
	st.success("You are Active")
else:
	st.warning("Inactive")

# SelectBox
occupation = st.selectbox("Your occupation",["Programmer", "Data Scienctist", "Doctor", "Businessman"])
st.write("You selected this option", occupation)


# MultiSelect
location = st.multiselect("Where do you work?", ("London", "New York", "Accra", "Kiev", "Nepal"))
st.write("You selected", len(location), "locations")

# Slider
level = st.slider("What is your level?",1,5)

# Buttons
st.button("Simple Button")
if st.button("About"):
	st.text("Streamlit is Cool")

# Text input
firstname = st.text_input("Enter your First Name:", "Type Here")
if st.button("Submit"):
	result = firstname.title()
	st.success(result)

# Text Area
message = st.text_area("Enter your message:", "Type Here")
if st.button("Submit "):
	result = message.title()
	st.success(result)

# Date Input
import datetime
today = st.date_input("Today is", datetime.datetime.now())

# Time
the_time = st.time_input("The time is", datetime.time())

# Displaying JSON
st.text("Display JSON")
st.json({'name':'Roberto', 'Gender':'Male'})

# Display Raw Code
st.text("Display Raw Code")
st.code("import numpy as np")

# Display Raw Code
with st.echo():
	# This will also show as a comment
	import pandas as pd
	df = pd.DataFrame()

# Progress Bar
import time
my_bar = st.progress(0)
for p in range(10):
	my_bar.progress(p + 1)

# Spinner
with st.spinner("Waiting .."):
	time.sleep(5)
st.success("Finished")

# Balloons
# st.balloons()

# SIDEBARS
st.sidebar.header("About")
st.sidebar.text("This is Streamlit tutorial	")

# Fucntions
@st.cache
def run_function():
	return range(100)

st.write(run_function)

# Plot
st.pyplot()

# DataFrames

#st.dataframe(df)

# Tables
#st.table(df)