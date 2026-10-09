
	/*-------------------------------------------------------------------------------
	*                  Stata Customized Program Installer
	*-------------------------------------------------------------------------------
	* AUTHOR	  :  Md. Redoan Hossain Bhuiyan
	* EMAIL		  :  redoanhossain630@gmail.com
	* PHONE		  :  +8801675735811
	* LOCATION	  :  Dhaka, Bangladesh
	* DATE		  :  12th July, 2025
	* LAST UPDATE :  10th October, 2026
	*-------------------------------------------------------------------------------

	PURPOSE:
			This program installs a suite of custom Stata tools designed to enhance
			data quality assurance and streamline data processing workflows. These tools
			provide specialized functionality for:
				- Data quality reports
				- Table exports
				- Optimal counts analysis
				- Bias detection
				- Automated codebook generation
				- Open-ended response handling
				- Input correction (String)
				- Outlier detection (Numeric)
				- Searching, blanking and banner tables

		    The tools are free to use and will be permanently available after installation.


	*-------------------------------------------------------------------------------
	*                  DATA QUALITY TOOLS DESCRIPTION
	*-------------------------------------------------------------------------------

	 1. optcounts - Special Value Tracker
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Tracks frequency of user-defined special values (e.g., -99, 99, -999 -96)
	 Features:
	   - Counts occurrences per enumerator/variable
	   - Identifies prevalence of specific codes for both string & bytes
	   - Generates a descriptive table of number of survey along with the count of given codes.


	 2. detectoutlier - Outlier Detection Tool
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Identifies outliers in numeric variables
	 Features:
	   - Uses mean ± k standard deviations method
	   - Auto-checks all numeric variables when none specified
	   - Exports to Excel with:
	     • Variable names/labels
	     • Outlier values
	     • Minimum and Maximum value

	 3. exportopenended - Text Response Exporter
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Exports open-ended responses to Excel
	 Output Structure (long format):
	   1. ID variable (default key)
	   2. Original variable name
	   3. Text response (data)
	   4. Empty column for translations


	 4. inputcorrection - Text Correction Processor
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Applies corrected text values from Excel to Stata datasets
	 Features:
	   - Updates open-ended/text responses
	   - Processes post-fieldwork edits
	   - Handles translations


	 5. gencodebook - Automated Codebook Generator
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Creates professional dataset documentation
	 Features:
	   - Excel format output
	   - Includes:
	     • Variable labels
	     • Storage types
	     • Missing value statistics


	 6. biascheck - Enumerator Bias Detector
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Identifies potential enumerator bias in survey responses
	 Features:
	   - Analyzes ordinal/Likert-scale questions
	   - Generates frequency distribution tables
	   - Shows enumerator deviations from overall trends


	 7. exporttables - Batch Table Exporter
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose:  Exports a formatted table for every variable of a dataset to one Excel workbook
	 Features:
	   - Single choice, multiple choice (select_multiple) and continuous tables
	   - Every table crossed by a category such as district with the by() option
	   - Text variables with up to 50 answers are tabled too (data from Excel)
	   - Index sheet with a link to every table
	   - Formatted by Stata itself, no Python needed

	 8. datareport - Data Quality Report
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose:  Writes a formatted Excel report describing every variable of a dataset
	 Features:
	   - Type, label, missing counts, value labels and a summary per variable
	   - Folds SurveyCTO / ODK / Kobo multiple-select questions into one row
	   - Optional XLSForm for sharper detection and option labels

	 9. searchfor - Search Utility
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose:  Finds any text, number or pattern across the variables of a dataset

	 10. blankvar - Blank Out Variables
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose:  Clears string and numeric variables in one command (string -> "", numeric -> .)

	 11. supertable - Banner Tables
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose:  Nested banner cross-tabulations (up to 5 by() levels) exported to Excel

	 12. stata_error_sound (dosound) - Error Sound
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose:  Runs a do-file and plays a sound if it stops with an error
	*-------------------------------------------------------------------------------*/


	*-------------------------------------------------------------------------------
	*                  TOOL INSTALLATION SECTION
	*-------------------------------------------------------------------------------

	display _n(1)
	display "Starting installation process..."
	display "Please wait while tools are being installed..."

	// Package names, and the GitHub repository each one lives in
	local tools optcounts biascheck gencodebook exportopenended inputcorrection detectoutlier exporttables datareport searchfor blankvar supertable stata_error_sound
	local repos optcounts biascheck gencodebook exportopenended inputcorrection detectoutlier exporttables datareport searchfor blankvar supertable stata-error-sound
	local n : word count `tools'
	local failed ""

	forvalues i = 1/`n' {
		local tool : word `i' of `tools'
		local repo : word `i' of `repos'
		display _n(1)
		display "Installing `tool' (Tool `i' of `n')..."

		cap ado uninstall `tool'
		// one failed download must not stop the others
		capture noisily net install `tool', from("https://raw.githubusercontent.com/RanaRedoan/`repo'/main") replace
		if _rc local failed "`failed' `tool'"
		else help `tool'
	}


	display _n(1)
	if "`failed'" == "" {
		display "INSTALLATION COMPLETED SUCCESSFULLY"
	}
	else {
		display as error "These tools could not be installed:`failed'"
		display as error "Check your internet connection and run this file again."
	}
	display "Type, for example, {bf:help datareport} to read about a tool."
	display "For support, bug reports, or feature requests, please contact to the author"
