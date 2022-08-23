import push.twitter as twitter
import push.bcv as bcv

def main(metodo,fuente,numerador,denominador):
    # sin parametros
    if metodo == 0:
        try:
            print('===== twitter ====')
            twitter.capturarRecientes(fuente,numerador,denominador)
        except Exception as e:
            print("Problemas con el servidor destino => TWITTER", e)    
        
        try:
            print('========== BCV ==========')
            bcv.capturaTodas()
        except Exception as e:
            print("Problemas con el servidor destino => BCV", e)    
    # con parametros
    elif metodo == 1:
        if fuente == 'monitordolarvla':
            try:
                twitter.capturarRecientes(fuente,numerador,denominador)
            except Exception as e:
                print("Problemas con el servidor destino => TWITTER", e)
        elif fuente == 'bcv':
            try:
                bcv.capturaUna(fuente,numerador,denominador)
            except Exception as e:
                print("Problemas con el servidor destino => BCV", e)