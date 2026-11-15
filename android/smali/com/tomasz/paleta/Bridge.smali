.class public Lcom/tomasz/paleta/Bridge;
.super Ljava/lang/Object;

.field private a:Lcom/tomasz/paleta/MainActivity;

.method public constructor <init>(Lcom/tomasz/paleta/MainActivity;)V
    .registers 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/tomasz/paleta/Bridge;->a:Lcom/tomasz/paleta/MainActivity;
    return-void
.end method

.method private pi(ILjava/lang/String;Ljava/lang/String;)Landroid/app/PendingIntent;
    .registers 8
    iget-object v0, p0, Lcom/tomasz/paleta/Bridge;->a:Lcom/tomasz/paleta/MainActivity;
    new-instance v1, Landroid/content/Intent;
    const-class v2, Lcom/tomasz/paleta/AlarmReceiver;
    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const-string v2, "id"
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    const-string v2, "t"
    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    const-string v2, "x"
    invoke-virtual {v1, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    const/high16 v2, 0x8000000
    const/high16 v3, 0x4000000
    or-int/2addr v2, v3
    invoke-static {v0, p1, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;
    move-result-object v0
    return-object v0
.end method

.method public schedule(IILjava/lang/String;Ljava/lang/String;)V
    .registers 13
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation
    invoke-direct {p0, p1, p3, p4}, Lcom/tomasz/paleta/Bridge;->pi(ILjava/lang/String;Ljava/lang/String;)Landroid/app/PendingIntent;
    move-result-object v0
    iget-object v1, p0, Lcom/tomasz/paleta/Bridge;->a:Lcom/tomasz/paleta/MainActivity;
    const-string v2, "alarm"
    invoke-virtual {v1, v2}, Lcom/tomasz/paleta/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/app/AlarmManager;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v2
    int-to-long v4, p2
    const-wide/16 v6, 0x3e8
    mul-long/2addr v4, v6
    add-long/2addr v2, v4
    const/4 v4, 0x0
    invoke-virtual {v1, v4, v2, v3, v0}, Landroid/app/AlarmManager;->setAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V
    return-void
.end method

.method public cancel(I)V
    .registers 6
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation
    const-string v0, ""
    invoke-direct {p0, p1, v0, v0}, Lcom/tomasz/paleta/Bridge;->pi(ILjava/lang/String;Ljava/lang/String;)Landroid/app/PendingIntent;
    move-result-object v0
    iget-object v1, p0, Lcom/tomasz/paleta/Bridge;->a:Lcom/tomasz/paleta/MainActivity;
    const-string v2, "alarm"
    invoke-virtual {v1, v2}, Lcom/tomasz/paleta/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/app/AlarmManager;
    invoke-virtual {v1, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V
    return-void
.end method
