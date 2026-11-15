.class public Lcom/tomasz/paleta/MainActivity;
.super Landroid/app/Activity;

.field private web:Landroid/webkit/WebView;

.field public cb:Landroid/webkit/ValueCallback;

.method public constructor <init>()V
    .registers 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 6
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
    new-instance v0, Landroid/webkit/WebView;
    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/tomasz/paleta/MainActivity;->web:Landroid/webkit/WebView;
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
    move-result-object v1
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V
    new-instance v3, Landroid/webkit/WebViewClient;
    invoke-direct {v3}, Landroid/webkit/WebViewClient;-><init>()V
    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V
    new-instance v3, Lcom/tomasz/paleta/ChromeClient;
    invoke-direct {v3, p0}, Lcom/tomasz/paleta/ChromeClient;-><init>(Lcom/tomasz/paleta/MainActivity;)V
    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V
    new-instance v3, Lcom/tomasz/paleta/Bridge;
    invoke-direct {v3, p0}, Lcom/tomasz/paleta/Bridge;-><init>(Lcom/tomasz/paleta/MainActivity;)V
    const-string v2, "Android"
    invoke-virtual {v0, v3, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v2, 0x21
    if-lt v1, v2, :noperm
    const-string v1, "android.permission.POST_NOTIFICATIONS"
    invoke-virtual {p0, v1}, Lcom/tomasz/paleta/MainActivity;->checkSelfPermission(Ljava/lang/String;)I
    move-result v2
    if-eqz v2, :noperm
    const/4 v2, 0x1
    new-array v2, v2, [Ljava/lang/String;
    const/4 v3, 0x0
    aput-object v1, v2, v3
    const/4 v3, 0x2
    invoke-virtual {p0, v2, v3}, Lcom/tomasz/paleta/MainActivity;->requestPermissions([Ljava/lang/String;I)V
    :noperm
    invoke-virtual {p0, v0}, Lcom/tomasz/paleta/MainActivity;->setContentView(Landroid/view/View;)V
    const-string v3, "file:///android_asset/index.html"
    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    return-void
.end method

.method public onBackPressed()V
    .registers 3
    iget-object v0, p0, Lcom/tomasz/paleta/MainActivity;->web:Landroid/webkit/WebView;
    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z
    move-result v1
    if-eqz v1, :cond_0
    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V
    return-void
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 6
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V
    iget-object v0, p0, Lcom/tomasz/paleta/MainActivity;->cb:Landroid/webkit/ValueCallback;
    if-eqz v0, :end
    invoke-static {p2, p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->parseResult(ILandroid/content/Intent;)[Landroid/net/Uri;
    move-result-object v1
    invoke-interface {v0, v1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V
    const/4 v1, 0x0
    iput-object v1, p0, Lcom/tomasz/paleta/MainActivity;->cb:Landroid/webkit/ValueCallback;
    :end
    return-void
.end method
