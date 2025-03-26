%dw 2.0
output application/json
---
{
	"status": p('default.errorStatus'),
	"message": {
		"correlationId": correlationId,
		"description": {
			"errorType": if(vars.error.errorType == "APIKIT.RETRY_EXHAUSTED") p('default.connectivityError') else vars.error.errorType default p('default.connectivityError'),
			"errorDescription": vars.error.errorDescription default p('default.UnknownError')
		}
	}
}