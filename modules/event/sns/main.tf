resource "aws_lambda_permission" "sns" {
  count         = "${var.enable}"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  principal     = "sns.amazonaws.com"
  statement_id  = "AllowSubscriptionToSNS"
  source_arn    = "${var.topic_arn}"
}

resource "aws_sns_topic_subscription" "subscription" {
  count     = "${var.enable}"
  endpoint  = "${var.endpoint}"
  protocol  = "lambda"
  topic_arn = "${var.topic_arn}"
}
