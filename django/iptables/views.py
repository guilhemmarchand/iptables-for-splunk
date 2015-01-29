from django.contrib.auth.decorators import login_required
from splunkdj.decorators.render import render_to

@render_to('iptables:home.html')
@login_required
def home(request):
    return {
        "message": "Hello World from iptables!",
        "app_name": "iptables"
    }
