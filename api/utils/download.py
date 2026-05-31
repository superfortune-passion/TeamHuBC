from django.http import HttpResponse

def get_download_response(df, filename):
    csv_text = df.to_csv(index=False)
    response = HttpResponse(csv_text, content_type='text/csv')
    response['Content-Disposition'] = 'inline; filename=' + filename
    return response
