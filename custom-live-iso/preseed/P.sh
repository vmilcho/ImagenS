#! /bin/sh

# This is a debconf-compatible script
. /usr/share/debconf/confmodule

# Create the template file
cat > /tmp/myquestion.template <<'!EOF!'
Template: my-question/ask
Type: select
Choices: First, Second, Third
Description: Custom question
 Template for querying a basic text.

Template: my-question/title
Type: text
Description: My question text
!EOF!

# Load your template
debconf-loadtemplate my-question /tmp/myquestion.template

# Set title for your custom dialog box
db_settitle my-question/title

# Ask it!
db_input critical my-question/ask
db_go

# Get the answer
db_get my-question/ask

# Save it to a file
echo "$RET" > /tmp/answer.value
