function fn() 
{   
 var env = karate.env; // get system property 'karate.env'
 karate.log('karate.env system property was:', env);
	 if (!env) {
	   env = 'api-beta';
	   baseUrl = 'https://apiv-beta.lightmetrics.co/v1/'
	 }
	 var config = {
	   env: env,
	   baseUrl = 'https://apiv-beta.lightmetrics.co/v1/' 
	 } 
	 if (env == 'api-qa') {

	   baseUrl = 'https://api-qa.lightmetrics.co/v1/' 
	 } 
	 else if (env == 'apiv-qa') {

	   baseUrl = 'https://apiv-qa.lightmetrics.co/v1/'
	 }
		karate.configure('connectTimeout', 60000);
		karate.configure('readTimeout', 60000);
		karate.log('karate.env =', karate.env);
		karate.log('config.baseUrl =', config.baseUrl);
	 return config;
}