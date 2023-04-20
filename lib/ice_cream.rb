# Les lignes qui appellent les gems
require 'http'
require 'json'
require 'dotenv'

# Ligne qui charge la variable d'environement, donc indique le chemin pour la clé API
Dotenv.load ('../.env')

api_key = ENV["OPENAI_API_KEY"] # La clef API sert à identifier l'utilisateur (moi) auprès de l'API OpenAI et ensuite effectuer des requêtes vers l'API.
url = "https://api.openai.com/v1/engines/text-davinci-003/completions" # Envoie une requête à l'API OpenAI

# Content-Type indique le type de contenu qu'on envoi, donc "application/json"
# Authorization fourni la clé API (bearer = détenteur)
headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}"
}

data = {
"prompt" => gets.chomp, #.plain vanilla milkshake recipe, to eat = tokens: 80 / temp: 0.5 / n: 1 / stop: "Instructions"  #.5 parfums de glace = tokens: 30 / temp: 0.7 / n:5
"max_tokens" => 20, # nombre d'unité demandée. Capital tokens : 2 millions. 
"temperature" => 0.5, # degré d'exploration fixé entre 0 et 1, plus elle est élevée, plus la réponse est créative 
"n" => 1 # nombre de réponse demandée pour une entrée prompt
}
    
response = HTTP.post(url, headers: headers, body: data.to_json) # crée une variable "response" et envoie une requête HTTP à l'URL, en spécifiant le headers
response_body = JSON.parse(response.body.to_s) # crée une variable "response_body" et convertit la réponse de l'API en JSON pour pouvoir accéder aux contenues de la réponse
response_string = response_body['choices'][0]['text'].strip # crée une variable "response_string"
        
puts response_string




