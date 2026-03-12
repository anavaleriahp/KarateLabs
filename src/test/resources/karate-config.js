function fn(){
    var env = karate.env || 'dev';
    karate.log('Ejecutando en ambiente', env);

    var config = {
        baseUrl: 'https://dummyjson.com',
        baseTokenUrl: 'https://dummyjson.com/auth/login',
    };
    //Configuracion global de SSL
    karate.configure('ssl',  true);

    if(env == 'cert'){
        config.baseUrl = 'https://dummyjsonqa.com';
    }

    return config;
}