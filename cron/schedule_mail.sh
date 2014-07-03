cd /Users/twer/SmallGiant/rails/railsMail
echo "Prepare to post to ask leave email now">>~/log.txt
rails runner "PostHelper.post_email_to_ask_leave_api"
