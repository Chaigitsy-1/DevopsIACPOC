from flask import Flask, request

import dbappend
app = Flask(__name__)
#cors=CORS(app)
@app.route('/entry',methods=['POST'])

def entry_maker():
    key=request.form['key']
    value=request.form['Value']
    print(key)
    print(value)
    if(key=='' or value==''):

        return 'invalid'
    resul=dbappend.append(key,value) 
    print(resul)
    return 'Success'

if __name__=="__main__":
    app.run(host='0.0.0.0',debug=True,port=5000)
    
