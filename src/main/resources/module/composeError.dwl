%dw 2.0
output application/json
---
{
	"errorCode": vars.httpStatus,
	"errorType": if(vars.error_object == null) error.errorType.asString else vars.error_object.errorType.asString,
	"errorDescription": if(vars.error_object == null)
	(if(error.muleMessage.typedValue != null) error.muleMessage.typedValue default p('default.UnknownError')
		else error.description)
	else
	(if(vars.error_object.muleMessage.typedValue != null) if(isEmpty(vars.error_object.muleMessage.typedValue)) vars.error_object.description else vars.error_object.muleMessage.typedValue default p('default.UnknownError')
		else vars.error_object.description),
	"detailedDescription": if(vars.error_object == null) error.description else vars.error_object.description
}