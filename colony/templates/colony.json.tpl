{
    {% if RUN_MODE %}"RUN_MODE" : "{{ RUN_MODE }}",{% endif %}
    "REPO_URL" : [
        ["colony", "https://colony.bemisc.com/"]{% if REPO_USERNAME and REPO_PASSWORD %},
        ["hive", "https://{{ REPO_USERNAME }}:{{ REPO_PASSWORD }}@colony.private.hive.pt/"]{% endif %}
    ]
}
