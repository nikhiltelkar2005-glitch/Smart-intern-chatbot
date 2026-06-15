import os
import google.cloud.dialogflow as dialogflow
from dotenv import load_dotenv

load_dotenv()
project_id = os.getenv("DIALOGFLOW_PROJECT_ID")

def list_intents(project_id):
    intents_client = dialogflow.IntentsClient()
    parent = dialogflow.AgentsClient.agent_path(project_id)
    intents = intents_client.list_intents(request={"parent": parent})

    for intent in intents:
        print(f"Intent Name: {intent.display_name}")
        for param in intent.parameters:
            print(f"  - Parameter: {param.display_name} (Required: {param.mandatory})")

list_intents(project_id)
