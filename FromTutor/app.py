# To Run this on browser type on temrinal: streamlit run app.py

# Steps to update app on Heroku:

# git add .
# git commit -m "Enter your message here"
# git push heroku master
# heroku ps:scale web=1

# Reference: https://towardsdatascience.com/deploy-streamlit-on-heroku-9c87798d2088

# Import required libraries
import streamlit as st
st.set_page_config(page_title='Quality Control Charts',layout='wide')
from PIL import Image
import numpy as np
import pandas as pd
import base64

import hvplot
import hvplot.pandas
import holoviews as hv
hv.extension('bokeh', logo=False)

import matplotlib.pyplot as plt
import statistics

# Licences
licences = ['roberto']

# Define error variables as False
error_type = False
error_negative = False

# Functions
def data_validation(error_type, error_negative):

	# Validate data
	st.header("**Data Validation**")

	if df.shape[1] == 1:
		data = np.array(df.iloc[:,0])
		for value in data:
			if value.dtype != 'float64':
				if value.dtype != 'int64':
					error_type = True
				else:
					if value < 0:
						error_negative = True
			else:
				if value < 0:
					error_negative = True

	elif df.shape[1] == 2:
		column1 = np.array(df.iloc[:,0])
		column2 = np.array(df.iloc[:,1])

		for value in column1:
			if value.dtype != 'float64':
				if value.dtype != 'int64':
					error_type = True
				else:
					if value < 0:
						error_negative = True
			else:
				if value < 0:
					error_negative = True

		for value in column2:
			if value.dtype != 'float64':
				if value.dtype != 'int64':
					error_type = True
				else:
					if value < 0:
						error_negative = True
			else:
				if value < 0:
					error_negative = True

	else:
		st.error("Error: the input file can have at the most 2 columns.")

	# Display validation results
	if error_type == False:
		st.success("Successful validation: all data points are numeric-type.")
		if error_negative == False:
			st.success("Successful validation: all data points are non-negative.")
		else:
			st.error("Error: the value of at least one data point is negative.")
	else:
		st.error("Error: the data points must be numeric-type.")

	# Display data frame summary statistics
	st.header("**Summary Statistics**")
	st.markdown("The below data frame with the summary statistics of the data provided on the *.cvs file.")
	st.dataframe(df.iloc[:,0].describe())


def download_link(object_to_download, download_filename, download_link_text):
    """
    Generates a link to download the given object_to_download.
    object_to_download (str, pd.DataFrame):  The object to be downloaded.
    download_filename (str): filename and extension of file. e.g. mydata.csv, some_txt_output.txt
    download_link_text (str): Text to display for download link.

    Examples:
    download_link(YOUR_DF, ‘YOUR_DF.csv’, ‘Click here to download data!’)
    download_link(YOUR_STRING, ‘YOUR_STRING.txt’, ‘Click here to download your text!‘)
    """
    if isinstance(object_to_download,pd.DataFrame):
        object_to_download = object_to_download.to_csv(index=False)
    
    # some strings <-> bytes conversions necessary here
    b64 = base64.b64encode(object_to_download.encode()).decode()
    
    return f'<a href="data:file/txt;base64,{b64}" download="{download_filename}">{download_link_text}</a>'

# Set title
st.title("Quality Control Charts")
st.markdown("Quality control charts represent a great tool for engineers to monitor if a process is under statistical control. They help visualize variation, find and correct problems when they occur, predict expected ranges of outcomes and analyze patterns of process variation from special or common causes. Quality control charts are often used in Lean Six Sigma and DMAIC projects under the Control phase and are considered as one of the seven basic quality tools for process improvement.")

# Display main picture
logo = Image.open("pic.PNG")
st.image(logo)

# Charts logic tree
st.header('**Choosing the Appropriate Control Chart**')
st.markdown("The appropriate control chart to use is determined by the type of data (i.e. measurement), the number of defects and the sample size. The following decision tree illustrates the conditions for each control chart, respectively:")
logic = Image.open("logic.PNG")
st.image(logic)

st.header('**Control Limits**')
st.markdown('Control limits are plotted lines above and below the center line (i.e. mean) in quality control charts that function as thresholds to identify signals (i.e. points beyond control limits) and help determining if a process is under statistical control. They are defined by formulas specific to each type of control chart that include constants, which vary depending on the sample size.')

st.markdown('---')

st.header('**About this Program**')
st.markdown('The objective of this program is to build quality control charts for the provided data and analyze if the process being analyzed is under statistical control by detecting units or samples outside the control limits.')
st.markdown("For *I*, *mR*, *x-bar*, *R*, *s*, *c* & *np*-charts, the user must input a *csv file with a single column correspnding to the measure value or count of defects. The column ***must*** have a header and the values ***must*** be numeric-type.")
st.markdown("For *u* & *p*-charts, the user must input a *csv file with two columns: one correspnding to the measure value or count of defects and one corresponding to the sample size. The columns ***must*** have a header and the values ***must*** be numeric-type.")

st.subheader('**Inputs**')
st.markdown('*	License key')
st.markdown('*	*csv file')

csv_example = Image.open("csv_example.PNG")
st.image(csv_example,width=300)

st.subheader('**Outputs**')
st.markdown('*	Control Chart')
st.markdown('*	Data frame with units/samples out of control limits')

st.subheader('**License Information**')
st.markdown('To run this program, a license is required.')
st.markdown("Get a **lifetime access license** for only $3.00 USD by clicking [here](https://www.paypal.com/invoice/p/#7TAET7SBF4H5D9FR). You will receive an email with your license key once your payment has been confirmed.")

st.markdown("---")

# DataSAM Logo on Sidebar
#logo = Image.open("DataSAM.jpeg")
#st.sidebar.image(logo, width=100)

# Read constants csv file
constants = pd.read_csv('constants.csv')
constants.set_index('m', drop=True, inplace=True)

# License validation
st.sidebar.header("**License Validation**")
license = st.sidebar.text_area("Insert license key:","")

if license == "":
	st.sidebar.warning("Insert license key. If you do not have an activated license key, click [here](https://www.paypal.com/invoice/p/#7TAET7SBF4H5D9FR) to purchase a lifetime access license for only $3.00 USD.")

license_found = False

for i in licences:

	if i == license:

		license_found = True

		# Import data
		st.sidebar.header("Data Loading")
		data_file = st.sidebar.file_uploader("Upload *.csv file here", type=["csv"], key=None)
		if data_file != None:
			df = pd.read_csv(data_file)

			# Display data frame
			st.header("**Data Visualization**")
			st.markdown("The below data frame dispays the top 10 rows for the data provided on the *.cvs file.")
			st.dataframe(df.head(10))

			# Radio Buttons
			st.sidebar.header("Data Type")
			data_type = st.sidebar.radio("Select data type", ("Continuous","Discrete"))

			# Defect Charts
			if data_type ==  "Discrete":

				# Validation that all data points are discrete numbers
				all_discrete = True
				for point in df.iloc[:,0]:
					if point%1 != 0:
						all_discrete = False
					
				# Display error if at least one data point is not a discrete value
				if all_discrete == False:
					st.sidebar.error("Error: all data points must be discrete values.")

				# If all the data points are discrete values:
				else:
					
					# Select defects category
					st.sidebar.header("Defects Category")
					defects_type = st.sidebar.radio("Select defects category", ("Defective/non-defective unit", "Multiple defects per unit"))

					if defects_type == "Defective/non-defective unit":

						# Select sample size type
						st.sidebar.header("Sample Type")
						sample_size_type = st.sidebar.radio("Constant sample size?", ("Yes", "No"))

						# NP CHART
						if sample_size_type == "Yes":

							st.sidebar.header("Sample Size")
							sampleSize = st.sidebar.number_input("Type sample size",0,max_value=25)
							sample_size = int(sampleSize)

							if sample_size == 0:

								st.sidebar.error("Error. The sample size must be greater than zero.")

							elif sample_size<max(df.iloc[:,0]):

								st.sidebar.error(f"Error. The number of nonconforming units per sample cannot be greater than the sample size. Minimum sample size allowed: {max(df.iloc[:,0])}")

							else:

								if st.sidebar.button('Run Program'):

									data_validation(error_type, error_negative)

									df['sample_number'] = range(1,len(df.iloc[:,0])+1)
									df['sample_size'] = sample_size
									df['fraction defective'] = df.iloc[:,0]/sample_size
									df['mean'] = statistics.mean(df['fraction defective'])
									df['UCL'] = statistics.mean(df['fraction defective'])+3*(np.sqrt((statistics.mean(df['fraction defective'])*(1-statistics.mean(df['fraction defective'])))/statistics.mean(df['sample_size']))) 
									df['LCL'] = max(statistics.mean(df['fraction defective'])-3*(np.sqrt((statistics.mean(df['fraction defective'])*(1-statistics.mean(df['fraction defective'])))/statistics.mean(df['sample_size']))),0)

									line_plot = df.hvplot.line(
										x='sample_number', 
										y=['fraction defective', 'mean', 'UCL', 'LCL'], 
										xlabel="Sample Group",
										ylabel="Fraction Defective",
										ylim=(0,max(df['UCL'][0],max(df['fraction defective']))+0.1),
										title="np Chart for defective units",
										legend=True,
										height=500,
										width=1000)

									scatter_plot = df.hvplot.scatter(
										x='sample_number', 
										y=['fraction defective', 'mean', 'UCL', 'LCL'], 
										xlabel="Sample Group",
										ylabel="Fraction Defective",
										ylim=(0,max(df['UCL'][0],max(df['fraction defective']))+0.1),
										title="np Chart for defective units",
										legend=False,
										height=500,
										width=1000)

									st.header("**Control Chart**")
									st.markdown("The *np*-chart is used to monitor the **count of nonconforming units** in fixed samples of size *n*. The y-axis shows the total count of nonconforming units while the x-axis shows the sample group.")
									st.subheader("**np Chart**")
									st.bokeh_chart(hv.render(line_plot*scatter_plot, backend='bokeh'))

									# Validate points out of control limits
									st.header("**Data Analysis**")
									i = 0
									wrong_samples = []
									control = True
									for group in df['fraction defective']:
									    if group > (df['UCL'][i]) or group < (df['LCL'][i]):
									        control = False
									        wrong_samples.append(i+1)
									    i += 1
									if control == True:
									    st.success("All points within control limits.")
									else:
										st.warning(f"Samples {wrong_samples} out of fraction defective cotrol limits!")
										st.markdown("The below data frame contains the sample groups out of the control limits.")
										wrong_samples = [x-1 for x in wrong_samples]
										st.dataframe(df.iloc[wrong_samples,:])

										st.header('**Data File Exporting**')
										st.markdown('Export a data frame with the units/samples out of control limits for their further analysis.')
										tmp_download_link = download_link(df.iloc[wrong_samples,:], 'out_of_control.csv','Click here to export results')
										st.markdown(tmp_download_link, unsafe_allow_html=True)

						# P CHART
						else:
							
							if df.shape[1] == 1:

								st.sidebar.error("Error. Your input file must contain 2 columns: one for the count of nonconforming units and one for the sample size.")

							else:

								error_sample_size_less_than_nonconforming_units = False
								incorrect_rows = []

								for i in range(0,len(df.iloc[:,0])):
									if df.iloc[i,1] < df.iloc[i,0]:
										error_sample_size_less_than_nonconforming_units = True
										incorrect_rows.append(i+1)

								if error_sample_size_less_than_nonconforming_units == True:
									st.error(f"Error in rows {incorrect_rows}: the number of nonconforming units per sample cannot be greater than the sample sizes.")

								else:

									if st.sidebar.button("Run Program"):

										data_validation(error_type, error_negative)

										df['sample_number'] = range(1,len(df.iloc[:,0])+1)
										df['fraction defective'] = df.iloc[:,0]/df.iloc[:,1]
										df['mean'] = statistics.mean(df['fraction defective'])
										df['UCL'] = statistics.mean(df['fraction defective'])+3*(np.sqrt((statistics.mean(df['fraction defective'])*(1-statistics.mean(df['fraction defective'])))/(df.iloc[:,1])))
										df['LCL'] = statistics.mean(df['fraction defective'])-3*(np.sqrt((statistics.mean(df['fraction defective'])*(1-statistics.mean(df['fraction defective'])))/(df.iloc[:,1])))

										line_plot = df.hvplot.line(
										x='sample_number', 
										y=['fraction defective','mean'], 
										xlabel="Sample Group",
										ylabel="Fraction Defective",
										ylim=(0,max(df['UCL'][0],max(df['fraction defective']))+0.1),
										title="p Chart for defective units",
										legend=True,
										height=500,
										width=1000)

										scatter_plot = df.hvplot.scatter(
										x='sample_number', 
										y=['fraction defective','mean'], 
										xlabel="Sample Group",
										ylabel="Fraction Defective",
										ylim=(0,max(df['UCL'][0],max(df['fraction defective']))+0.1),
										title="p Chart for defective units",
										legend=False,
										height=500,
										width=1000)

										contol_limits_step_plot = df.hvplot.step(
										x='sample_number', 
										y=['UCL','LCL'], 
										xlabel="Sample Group",
										ylabel="Fraction Defective",
										lim=(0,max(df['UCL'][0],max(df['fraction defective']))+0.1),
										title="p Chart for defective units",
										legend=True,
										height=500,
										wodth=1000)

										contol_limits_scatter_plot = df.hvplot.scatter(
										x='sample_number', 
										y=['UCL','LCL'], 
										xlabel="Sample Group",
										ylabel="Fraction Defective",
										lim=(0,max(df['UCL'][0],max(df['fraction defective']))+0.1),
										title="p Chart for defective units",
										legend=True,
										height=500,
										width=1000)

										st.header("**Control Chart**")
										st.subheader("**p Chart**")
										st.markdown("The *p*-chart is used to monitor the **proportion of nonconforming** units in different samples of size *n*; it is based on the binomial distribution where each unit has only two possibilities (i.e. defective or not defective).")
										st.bokeh_chart(hv.render(line_plot*scatter_plot*contol_limits_step_plot*contol_limits_scatter_plot, backend='bokeh'))

										# Validate points out of control limits
										st.header("**Data Analysis**")
										i = 0
										wrong_samples = []
										control = True
										for group in df['fraction defective']:
										    if group > (df['UCL'][i]) or group < (df['LCL'][i]):
										        control = False
										        wrong_samples.append(i+1)
										    i += 1
										if control == True:
										    st.success("All points within control limits.")
										else:
											st.warning(f"Samples {wrong_samples} out of fraction defective cotrol limits!")
											st.markdown("The below data frame contains the sample groups out of the control limits.")
											wrong_samples = [x-1 for x in wrong_samples]
											st.dataframe(df.iloc[wrong_samples,:])

											st.header('**Data File Exporting**')
											st.markdown('Export a data frame with the units/samples out of control limits for their further analysis.')
											tmp_download_link = download_link(df.iloc[wrong_samples,:], 'out_of_control.csv','Click here to export results')
											st.markdown(tmp_download_link, unsafe_allow_html=True)

					else:

						st.sidebar.header("Sample Type")
						sample_size_type = st.sidebar.radio("Constant sample size?", ("Yes", "No"))

						# C CHART
						if sample_size_type == "Yes":

							st.sidebar.header("Sample Size")
							sampleSize = st.sidebar.number_input("Type sample size",0,max_value=25)
							sample_size = int(sampleSize)

							if sample_size == 0:

								st.sidebar.error("Error. The sample size must be greater than zero.")

							else:

								if st.sidebar.button("Run Program"):

									data_validation(error_type, error_negative)

									df['defects'] = df.iloc[:,0]
									df['sample_number'] = range(1,len(df.iloc[:,0])+1)
									df['sample_size'] = sample_size
									df['mean'] = statistics.mean(df['defects'])
									df['UCL'] = statistics.mean(df.iloc[:,0])+3*np.sqrt(statistics.mean(df.iloc[:,0]))
									df['LCL'] = max(statistics.mean(df.iloc[:,0])-3*np.sqrt(statistics.mean(df.iloc[:,0])),0)

									line_plot = df.hvplot.line(
										x='sample_number', 
										y=['defects', 'mean', 'UCL', 'LCL'], 
										xlabel="Sample Group",
										ylabel="Defects Count",
										ylim=(0,max(df['UCL'][0],max(df['defects']))),
										title="c Chart for defective units",
										legend=True,
										height=500,
										width=1000)

									scatter_plot = df.hvplot.scatter(
										x='sample_number', 
										y=['defects', 'mean', 'UCL', 'LCL'], 
										xlabel="Sample Group",
										ylabel="Defects Count",
										ylim=(0,max(df['UCL'][0],max(df['defects']))),
										title="c Chart for defective units",
										legend=False,
										height=500,
										width=1000)

									st.header("**Control Chart**")
									st.subheader("**c Chart**")
									st.markdown("The *c*-chart is used to monitor the **total count of defects** in fixed samples of size *n*.")
									st.bokeh_chart(hv.render(line_plot*scatter_plot, backend='bokeh'))

									# Validate points out of control limits
									st.header("**Data Analysis**")
									i = 0
									wrong_samples = []
									control = True
									for group in df['defects']:
										if group > (df['UCL'][i]) or group < (df['LCL'][i]):
										    control = False
										    wrong_samples.append(i+1)
										i += 1
									if control == True:
										st.success("All points within control limits.")
									else:
										st.warning(f"Samples {wrong_samples} out of fraction defects counts limits!")
										st.markdown("The below data frame contains the sample groups out of the control limits.")
										wrong_samples = [x-1 for x in wrong_samples]
										st.dataframe(df.iloc[wrong_samples,:])

										st.header('**Data File Exporting**')
										st.markdown('Export a data frame with the units/samples out of control limits for their further analysis.')
										tmp_download_link = download_link(df.iloc[wrong_samples,:], 'out_of_control.csv','Click here to export results')
										st.markdown(tmp_download_link, unsafe_allow_html=True)

						# U CHART
						else:

							if df.shape[1] == 1:

								st.error("Error. Your input file must contain 2 columns: one for the count of nonconforming units and one for the sample size.")

							else:

								if st.sidebar.button("Run Program"):

									data_validation(error_type, error_negative)

									df['sample_number'] = range(1,len(df.iloc[:,0])+1)
									df['fraction defective'] = df.iloc[:,0]/df.iloc[:,1]
									df['mean'] = statistics.mean(df['fraction defective'])
									df['UCL'] = df['fraction defective'].mean()+3*np.sqrt(df['fraction defective'].mean()/df.iloc[:,1])
									df['LCL'] = df['fraction defective'].mean()-3*np.sqrt(df['fraction defective'].mean()/df.iloc[:,1])

									line_plot = df.hvplot.line(
									x='sample_number', 
									y=['fraction defective', 'mean'], 
									xlabel= "Sample Group",
									ylabel="Fraction Defective",
									ylim=(0,max(df['UCL'][0],max(df['fraction defective']))+0.1),
									title="u Chart for defective units",
									legend=True,
									height=500,
									width=1000)

									scatter_plot = df.hvplot.scatter(
									x='sample_number', 
									y=['fraction defective', 'mean'], 
									xlabel="Sample Group",
									ylabel="Fraction Defective",
									ylim=(0,max(df['UCL'][0],max(df['fraction defective']))+0.1),
									title="u Chart for defective units",
									legend=False,
									height=500,
									width=1000)

									contol_limits_step_plot = df.hvplot.step(
									x='sample_number', 
									y=['UCL','LCL'], 
									xlabel="Sample Group",
									ylabel="Fraction Defective",
									lim=(0,max(df['UCL'][0],max(df['fraction defective']))+0.1),
									title="u Chart for defective units",
									legend=True,
									height=500,
									width=1000)

									contol_limits_scatter_plot = df.hvplot.scatter(
									x='sample_number', 
									y=['UCL','LCL'], 
									xlabel="Sample Group",
									ylabel="Fraction Defective",
									lim=(0,max(df['UCL'][0],max(df['fraction defective']))+0.1),
									title="u Chart for defective units",
									legend=True,
									height=500,
									width=1000)

									st.header("**Control Chart**")
									st.markdown("The *u*-chart is used to monitor the **total count of defects** per unit in different samples of size *n*; it assumes that units can have more than a single defect.")
									st.subheader("**u Chart**")
									st.bokeh_chart(hv.render(line_plot*scatter_plot*contol_limits_step_plot*contol_limits_scatter_plot, backend='bokeh'))

									# Validate points out of control limits
									st.header("**Data Analysis**")
									i = 0
									wrong_samples = []
									control = True
									for group in df['fraction defective']:
										if group > (df['UCL'][i]) or group < (df['LCL'][i]):
										    control = False
										    wrong_samples.append(i+1)
										i += 1
									if control == True:
										st.success("All points within control limits.")
									else:
										st.warning(f"Samples {wrong_samples} out of fraction defective cotrol limits!")
										st.markdown("The below data frame contains the sample groups out of the control limits.")
										wrong_samples = [x-1 for x in wrong_samples]
										st.dataframe(df.iloc[wrong_samples,:])

										st.header('**Data File Exporting**')
										st.markdown('Export a data frame with the units/samples out of control limits for their further analysis.')
										tmp_download_link = download_link(df.iloc[wrong_samples,:], 'out_of_control.csv','Click here to export results')
										st.markdown(tmp_download_link, unsafe_allow_html=True)

			# Continuous
			else:

				# Validate that only 1 column was inserted
				if df.shape[1] == 1:

					# Select sample size type
					st.sidebar.header("Sample Size")
					sample_size_continuous = st.sidebar.number_input("Type sample size",0,max_value=25)

					if sample_size_continuous != 0:

						if st.sidebar.button("Run Program"):

							if sample_size_continuous == 1:

								data_validation(error_type, error_negative)

								if error_negative == False and error_type == False:

									MR = [np.nan]

									# Get and append moving ranges
									for data in range(1, len(df)):
										MR.append(abs(df.iloc[data,0] - df.iloc[data-1,0]))

									# Rename first column
									df.rename(columns={df.columns[0]:'x'}, inplace=True)

									df['sample_number'] = range(1,len(df.iloc[:,0])+1)
									df['MR'] = MR
									df['x-bar'] = statistics.mean(df['x'])
									df['MR-bar'] = statistics.mean(df['MR'][1:len(df['MR'])])
									df['x_UCL'] = statistics.mean(df.iloc[:,0])+(constants['A2'][2]*np.sqrt(2))*statistics.mean(df['MR'][1:len(df['MR'])])
									df['x_LCL'] = statistics.mean(df.iloc[:,0])-(constants['A2'][2]*np.sqrt(2))*statistics.mean(df['MR'][1:len(df['MR'])])
									df['MR_UCL'] = constants['D4'][2]*df['MR-bar']
									df['MR_LCL'] = constants['D3'][2]*df['MR-bar']

									line_plot = df.hvplot.line(
									x='sample_number', 
									y=['x','x-bar','x_UCL','x_LCL'], 
									xlabel= "Sample Unit",
									ylabel="Individual Measure",
									ylim=(0,max(df['x_UCL'][0],max(df['x']))+0.1),
									title="I Chart for sampled untis",
									legend=True,
									height=500,
									width=1000)

									scatter_plot = df.hvplot.scatter(
									x='sample_number', 
									y=['x','x-bar','x_UCL','x_LCL'], 
									xlabel= "Sample Unit",
									ylabel="Individual Measure",
									ylim=(0,max(df['x_UCL'][0],max(df['x']))+0.1),
									title="I Chart for sampled units",
									legend=True,
									height=500,
									width=1000)

									st.header("**Control Charts**")
									st.markdown("The *I* and *mR* charts are used to monitor the mean and variation of a process based on individual samples taken in a given time.")

									st.subheader("**I Chart**")
									st.bokeh_chart(hv.render(line_plot*scatter_plot, backend='bokeh'))

									line_plot = df.hvplot.line(
									x='sample_number', 
									y=['MR','MR-bar','MR_UCL','MR_LCL'], 
									xlabel= "Sample Unit",
									ylabel="Moving Range (mR)",
									ylim=(0,max(df['MR_UCL'][0],max(df['MR']))+0.1),
									title="mR Chart for sampled units",
									legend=True,
									height=500,
									width=1000)

									scatter_plot = df.hvplot.scatter(
									x='sample_number', 
									y=['MR','MR-bar','MR_UCL','MR_LCL'], 
									xlabel= "Sample Unit",
									ylabel="Moving Range (mR)",
									ylim=(0,max(df['MR_UCL'][0],max(df['MR']))+0.1),
									title="mR Chart for sampled units",
									legend=True,
									height=500,
									width=1000)

									st.subheader("**mR Chart**")
									st.bokeh_chart(hv.render(line_plot*scatter_plot, backend='bokeh'))

									# Validate points out of control limits in I Chart
									st.header("**Data Analysis**")
									i = 0
									wrong_samples = []
									control = True
									for x in df['x']:
										if x > (statistics.mean(df.iloc[:,0])+(constants['A2'][2]*np.sqrt(2))*statistics.mean(df['MR'][1:len(df['MR'])])) or x < (statistics.mean(df.iloc[:,0])-(constants['A2'][2]*np.sqrt(2))*statistics.mean(df['MR'][1:len(df['MR'])])):
										    control = False
										    wrong_samples.append(i)
										i += 1
									if control == True:
										st.success("All points within control limits in **I Chart**.")
									else:
										st.warning(f"Samples {wrong_samples} out of measures limits!")
										st.markdown("The below data frame contains the sample groups out of the control limits on the *I* chart.")
										wrong_samples = [x-1 for x in wrong_samples]
										st.dataframe(df.iloc[wrong_samples,:])

										st.header('**Data File Exporting**')
										st.markdown('Export a data frame with the units/samples out of control limits for their further analysis.')
										tmp_download_link = download_link(df.iloc[wrong_samples,:], 'I_ooo.csv','Click here to export results')
										st.markdown(tmp_download_link, unsafe_allow_html=True)

									# Validate points out of control limits in MR Chart
									i = 0
									wrong_samples = []
									control = True
									for MR in df['MR'][1:]:
										if MR > (df['MR_UCL'][0]) or MR < (df['MR_LCL'][0]):
										    control = False
										    wrong_samples.append(i)
										i += 1
									if control == True:
										st.success("All points within control limits in **mR Chart**.")
									else:
										st.warning(f"Samples {wrong_samples} out of measures limits!")
										st.markdown("The below data frame contains the sample groups out of the control limits on the *mR* chart.")
										wrong_samples = [x-1 for x in wrong_samples]
										st.dataframe(df.iloc[wrong_samples,:])

										st.header('**Data File Exporting**')
										st.markdown('Export a data frame with the units/samples out of control limits for their further analysis.')
										tmp_download_link = download_link(df.iloc[wrong_samples,:], 'mR_ooo.csv','Click here to export results')
										st.markdown(tmp_download_link, unsafe_allow_html=True)

							# x-bar and R chart
							elif sample_size_continuous > 1 and sample_size_continuous < 11:

								data_validation(error_type, error_negative)

								if error_negative == False and error_type == False:

									count = 0
									values = []
									x_bar = []
									values_ranges = []

									for measure in df.iloc[:,0]:
										if count < sample_size_continuous:
											values.append(measure)
											count+=1
										else:
											x_bar.append(statistics.mean(values))
											values_ranges.append(abs(max(values)-min(values)))
											count = 0
											values = []
											values.append(measure)
											count+=1

									df_grouped = pd.DataFrame({'x-bar':x_bar,'range':values_ranges})

									df_grouped['sample_number'] = range(0,len(df_grouped.iloc[:,0]))
									df_grouped['x_bar_bar'] = statistics.mean(x_bar)
									df_grouped['R_bar'] = statistics.mean(values_ranges)
									df_grouped['x_UCL'] = statistics.mean(df_grouped['x-bar'])+constants['A2'][sample_size_continuous]*statistics.mean(df_grouped['range'])
									df_grouped['x_LCL'] = statistics.mean(df_grouped['x-bar'])-constants['A2'][sample_size_continuous]*statistics.mean(df_grouped['range'])
									df_grouped['R_UCL'] = constants['D4'][sample_size_continuous]*statistics.mean(df_grouped['range'])
									df_grouped['R_LCL'] = constants['D3'][sample_size_continuous]*statistics.mean(df_grouped['range'])

									# x-bar chart
									line_plot = df_grouped.hvplot.line(
												x='sample_number', 
												y=['x-bar','x_bar_bar','x_UCL', 'x_LCL'], 
												xlabel= "Sample Group",
												ylabel="Average (x-bar)",
												ylim=(0,max(df_grouped['x_UCL'][0],max(df_grouped['x-bar']))+0.1),
												title="x-bar Chart for sampled groups",
												legend=True,
												height=500,
												width=1000)

									scatter_plot = df_grouped.hvplot.scatter(
												x='sample_number', 
												y=['x-bar','x_bar_bar','x_UCL', 'x_LCL'], 
												xlabel= "Sample Group",
												ylabel="Average (x-bar)",
												ylim=(0,max(df_grouped['x_UCL'][0],max(df_grouped['x-bar']))+0.1),
												title="x-bar Chart for sampled groups",
												legend=True,
												height=500,
												width=1000)

									st.header("**Control Charts**")
									st.markdown("The *x-bar* and *R*-charts are used to monitor the mean and variation (using the range) of a process based on samples taken in a given time.")
								
									st.subheader("**x-bar Chart**")
									st.bokeh_chart(hv.render(line_plot*scatter_plot, backend='bokeh'))

									line_plot = df_grouped.hvplot.line(
												x='sample_number', 
												y=['range','R_bar','R_UCL', 'R_LCL'], 
												xlabel= "Sample Group",
												ylabel="Range (R)",
												title="R Chart for sampled groups",
												legend=True,
												height=500,
												width=1000)

									# R chart
									scatter_plot = df_grouped.hvplot.scatter(
												x='sample_number', 
												y=['range','R_bar','R_UCL', 'R_LCL'], 
												xlabel= "Sample Group",
												ylabel="Range (R)",
												title="R Chart for sampled groups",
												legend=True,
												height=500,
												width=1000)

									st.subheader("**R Chart**")
									st.bokeh_chart(hv.render(line_plot*scatter_plot, backend='bokeh'))

									# Validate points out of control limits in x-bar Chart
									st.header("**Data Analysis**")
									i = 0
									wrong_samples = []
									control = True
									for x in df_grouped['x-bar']:
										if x > (statistics.mean(df_grouped['x-bar'])+constants['A2'][sample_size_continuous]*statistics.mean(df_grouped['range'])) or x < (statistics.mean(df_grouped['x-bar'])-constants['A2'][sample_size_continuous]*statistics.mean(df_grouped['range'])):
										    control = False
										    wrong_samples.append(i)
										i += 1
									if control == True:
										st.success("All points within control limits in **x-bar Chart**.")
									else:
										st.warning(f"Samples {wrong_samples} out of measures limits!")
										st.markdown("The below data frame contains the sample groups out of the control limits on the *x-bar* chart.")
										wrong_samples = [x-1 for x in wrong_samples]
										st.dataframe(df.iloc[wrong_samples,:])

										st.header('**Data File Exporting**')
										st.markdown('Export a data frame with the units/samples out of control limits for their further analysis.')
										tmp_download_link = download_link(df.iloc[wrong_samples,:], 'x_bar_ooo.csv','Click here to export results')
										st.markdown(tmp_download_link, unsafe_allow_html=True)


									# Validate points out of control limits in R Chart
									i = 0
									wrong_samples = []
									control = True
									for r in df_grouped['x-bar']:
										if r > (constants['D4'][sample_size_continuous]*statistics.mean(df_grouped['range'])) or r < (constants['D3'][sample_size_continuous]*statistics.mean(df_grouped['range'])):
										    control = False
										    wrong_samples.append(i)
										i += 1
									if control == True:
										st.success("All points within control limits in **R Chart**.")
									else:
										st.warning(f"Samples {wrong_samples} out of measures limits!")
										st.markdown("The below data frame contains the sample groups out of the control limits on the *R* chart.")
										wrong_samples = [x-1 for x in wrong_samples]
										st.dataframe(df.iloc[wrong_samples,:])

										st.header('**Data File Exporting**')
										st.markdown('Export a data frame with the units/samples out of control limits for their further analysis.')
										tmp_download_link = download_link(df.iloc[wrong_samples,:], 'R_ooo.csv','Click here to export results')
										st.markdown(tmp_download_link, unsafe_allow_html=True)

							# x-bar and s chart
							else:

								data_validation(error_type, error_negative)

								if error_negative == False and error_type == False:

									count = 0
									values = []
									x_bar = []
									values_sd = []

									for measure in df.iloc[:,0]:
										if count < sample_size_continuous:
											values.append(measure)
											count+=1
										else:
											x_bar.append(statistics.mean(values))
											values_sd.append(statistics.stdev(values))
											count = 0
											values = []
											values.append(measure)
											count+=1

									df_grouped = pd.DataFrame({'x-bar':x_bar,'s':values_sd})

									df_grouped['sample_number'] = range(0,len(df_grouped.iloc[:,0]))
									df_grouped['x_bar_bar'] = statistics.mean(x_bar)
									df_grouped['s_bar']= statistics.mean(values_sd)
									df_grouped['x_UCL'] = statistics.mean(df_grouped['x-bar'])+constants['A3'][sample_size_continuous]*statistics.mean(df_grouped['s'])
									df_grouped['x_LCL'] = statistics.mean(df_grouped['x-bar'])-constants['A3'][sample_size_continuous]*statistics.mean(df_grouped['s'])
									df_grouped['s_UCL'] = constants['B4'][sample_size_continuous]*statistics.mean(df_grouped['s'])
									df_grouped['s_LCL'] = constants['B3'][sample_size_continuous]*statistics.mean(df_grouped['s'])

									# x-bar chart
									line_plot = df_grouped.hvplot.line(
												x='sample_number', 
												y=['x-bar','x_bar_bar','x_UCL', 'x_LCL'], 
												xlabel= "Sample Group",
												ylabel="Average (x-bar)",
												ylim=(0,max(df_grouped['x_UCL'][0],max(df_grouped['x-bar']))+0.1),
												title="x-bar Chart for sampled groups",
												legend=True,
												height=500,
												width=1000)

									scatter_plot = df_grouped.hvplot.scatter(
												x='sample_number', 
												y=['x-bar','x_bar_bar','x_UCL', 'x_LCL'], 
												xlabel= "Sample Group",
												ylabel="Average (x-bar)",
												ylim=(0,max(df_grouped['x_UCL'][0],max(df_grouped['x-bar']))+0.1),
												title="x-bar Chart for sampled groups",
												legend=True,
												height=500,
												width=1000)

									st.header("**Control Charts**")
									st.markdown("The **x-bar** chart and *s*-chart are used to monitor the mean and variation (using the standard deviation) of a process based on samples taken in a given time.")

									st.subheader("**x-bar Chart**")
									st.bokeh_chart(hv.render(line_plot*scatter_plot, backend='bokeh'))

									line_plot = df_grouped.hvplot.line(
												x='sample_number', 
												y=['s','s_bar','s_UCL', 's_LCL'], 
												xlabel= "Sample Group",
												ylabel="Standard Deviation (s)",
												title="s Chart for sampled groups",
												legend=True,
												height=500,
												width=1000)

									# s chart
									scatter_plot = df_grouped.hvplot.scatter(
												x='sample_number', 
												y=['s','s_bar','s_UCL', 's_LCL'], 
												xlabel= "Sample Group",
												ylabel="Standard Deviation (s)",
												title="s Chart for sampled groups",
												legend=True,
												height=500,
												width=1000)

									st.subheader("**s Chart**")
									st.bokeh_chart(hv.render(line_plot*scatter_plot, backend='bokeh'))

									# Validate points out of control limits in x-bar Chart
									st.header("**Data Analysis**")
									i = 0
									wrong_samples = []
									control = True
									for x in df_grouped['x-bar']:
										if x > statistics.mean(df_grouped['x-bar'])+constants['A3'][sample_size_continuous]*statistics.mean(df_grouped['s']) or x < (statistics.mean(df_grouped['x-bar'])-constants['A3'][sample_size_continuous]*statistics.mean(df_grouped['s'])):
										    control = False
										    wrong_samples.append(i)
										i += 1
									if control == True:
										st.success("All points within control limits in **x-bar Chart**.")
									else:
										st.warning(f"Samples {wrong_samples} out of measures limits!")
										st.markdown("The below data frame contains the sample groups out of the control limits on the *x-bar* chart.")
										wrong_samples = [x-1 for x in wrong_samples]
										st.dataframe(df.iloc[wrong_samples,:])

										st.header('**Data File Exporting**')
										st.markdown('Export a data frame with the units/samples out of control limits for their further analysis.')
										tmp_download_link = download_link(df.iloc[wrong_samples,:], 'x_bar_ooo.csv','Click here to export results')
										st.markdown(tmp_download_link, unsafe_allow_html=True)


									# Validate points out of control limits in s Chart
									i = 0
									wrong_samples = []
									control = True
									for s in df_grouped['s_bar']:
										if s > (constants['B4'][sample_size_continuous]*statistics.mean(df_grouped['s'])) or s < (constants['B3'][sample_size_continuous]*statistics.mean(df_grouped['s'])):
										    control = False
										    wrong_samples.append(i)
										i += 1
									if control == True:
										st.success("All points within control limits in **s Chart**.")
									else:
										st.warning(f"Samples {wrong_samples} out of measures limits!")
										st.markdown("The below data frame contains the sample groups out of the control limits on the *s* chart.")
										wrong_samples = [x-1 for x in wrong_samples]
										st.dataframe(df.iloc[wrong_samples,:])

										st.header('**Data File Exporting**')
										st.markdown('Export a data frame with the units/samples out of control limits for their further analysis.')
										tmp_download_link = download_link(df.iloc[wrong_samples,:], 's_ooo.csv','Click here to export results')
										st.markdown(tmp_download_link, unsafe_allow_html=True)


					else:
						st.sidebar.error("Error. The sample size must be greater than zero.")

				else:
					st.error("Error: for obtaining control charts of continuous data points, the input file must contain only one column corresponding to the measured value.")

	if license_found == False and license != "":
		st.sidebar.error("Non-existing license. To run this program please purchase a lifetime access license for $3.00 USD by clicking [here](https://www.paypal.com/invoice/p/#7TAET7SBF4H5D9FR).")

	st.markdown("---")

	st.header("**About the Author**")

	profile_picture = Image.open("Roberto Salazar - Photo.PNG")
	st.image(profile_picture, width=250)

	st.markdown("## Roberto Salazar")
	st.markdown("Roberto Salazar is an Industrial and Systems Engineer with experience in the manufacturing, healthcare, consulting and academic industries.")
	st.markdown("He obtained his bachelor’s degree from Universidad de Monterrey (UDEM) and his master’s degree from Binghamton University, State University of New York (SUNY). His research interests include data analytics, machine learning, lean, six sigma, quality and continuous improvement.")
	st.write(" **Email**: mailto:rsalaza4@binghamton.edu | [LinkedIn](https://www.linkedin.com/in/roberto-salazar-reyna/) | [GitHub](https://github.com/rsalaza4) | [Programming Blogs](https://medium.com/@rsalaza4)")
