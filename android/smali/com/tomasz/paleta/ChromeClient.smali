.class public Lcom/tomasz/paleta/ChromeClient;
.super Landroid/webkit/WebChromeClient;

.field private a:Lcom/tomasz/paleta/MainActivity;

.method public constructor <init>(Lcom/tomasz/paleta/MainActivity;)V
    .registers 2
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V
    iput-object p1, p0, Lcom/tomasz/paleta/ChromeClient;->a:Lcom/tomasz/paleta/MainActivity;
    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .registers 7
    iget-object v0, p0, Lcom/tomasz/paleta/ChromeClient;->a:Lcom/tomasz/paleta/MainActivity;
    iget-object v1, v0, Lcom/tomasz/paleta/MainActivity;->cb:Landroid/webkit/ValueCallback;
    if-eqz v1, :nocb
    const/4 v2, 0x0
    invoke-interface {v1, v2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V
    :nocb
    iput-object p2, v0, Lcom/tomasz/paleta/MainActivity;->cb:Landroid/webkit/ValueCallback;
    :try_start_0
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;
    move-result-object v1
    const/4 v2, 0x1
    invoke-virtual {v0, v1, v2}, Lcom/tomasz/paleta/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    const/4 v2, 0x1
    return v2
    :catch_0
    move-exception v1
    const/4 v2, 0x0
    iput-object v2, v0, Lcom/tomasz/paleta/MainActivity;->cb:Landroid/webkit/ValueCallback;
    return v2
.end method
