Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E83FD4E66FA
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Mar 2022 17:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351680AbiCXQ12 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Mar 2022 12:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236357AbiCXQ11 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Mar 2022 12:27:27 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD61A9969
        for <linux-tegra@vger.kernel.org>; Thu, 24 Mar 2022 09:25:55 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id j18so7379769wrd.6
        for <linux-tegra@vger.kernel.org>; Thu, 24 Mar 2022 09:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=DSXjolq6QI3YRsC0AawPm0D/JP1NdEXMiQQYdfv1BAq+fzd6siH8tLe/wwdrcz+G06
         NWg38b68bWvDNBZibTtDRINW7oNZczWZF5xqC5Vy6hFErcRv6xw/hbtfezJFVRc3JJWZ
         GHtHvnghUcQE8PqgWb4RGctWp+vUkJRIyQR4KHuczP1RmWXZH1vhJ9/Vv/L6VqmJpKoB
         zjBhdRy2WQJO09C7yXJpczsdiSYwozd6lZNIVq4g07vE0IbUpTlGMHEpQCCqUKSkxIjL
         bWhNZ/fT8xt4AzOmZZKJzEtB9KCtYqokUpQPw5jRwMMug04EcR6EOZpBBB+JxoQR3On9
         QpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=NEHTxQWa/8g4h1/koqh8fMPhQ8jstD/VW0Dm4whIHYQh5WcUgkyCgt45YQy4mrgdKM
         0FXy0SgYEsUQKBBrnsnRbzd5EoswsJara37KqowCyRw7ezkmQG9dk6lRejhqdHxms64o
         obPUoEQD7ftwne82bHiOEUk4iMytXYZGOQZtWUlpvNmATtjRUE3BWMnQB1WrfedVPiDM
         rLtnu02tBQsoCu7FEWoBmFOindEQrpyJFS83UTJeHtZWFQwnMQbw+XgzJO1XjMO4l0p4
         sjSW7fQaw+1sTQ0mUq0CSPO05tEeTkHONoLMjIUnjWNJ6SWH9KQYU6Zd3cTnEjsZHtnJ
         0mQg==
X-Gm-Message-State: AOAM532D9tEu3HEhV+yt8g76PeWAFSs+4fM/SbBmD++kF7YqJ8pt8R4y
        s2GedYimYJtZJVu51EiFrOc=
X-Google-Smtp-Source: ABdhPJy3sFxJMKPKEtS3En+FNFME5YRLTzyHD7ekrDmdDcmtBLsbqAeUMcK3C2c2P1dLBpFbYY811Q==
X-Received: by 2002:adf:fb4e:0:b0:1e3:3e66:d5f6 with SMTP id c14-20020adffb4e000000b001e33e66d5f6mr5248455wrs.615.1648139154252;
        Thu, 24 Mar 2022 09:25:54 -0700 (PDT)
Received: from [192.168.0.102] ([105.112.209.229])
        by smtp.gmail.com with ESMTPSA id e8-20020a056000178800b00203da3bb4d2sm3496227wrg.41.2022.03.24.09.25.48
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2022 09:25:53 -0700 (PDT)
Message-ID: <623c9b91.1c69fb81.7a64.e872@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: meine Spende
To:     chenz4946@gmail.com
From:   chenz4946@gmail.com
Date:   Thu, 24 Mar 2022 09:25:42 -0700
Reply-To: mariaelisabethschaeffler70@gmail.com
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

 Hallo,

 =


Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Gesch=E4ftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, den Rest von 25% in diesem J=
ahr 2021 an Einzelpersonen zu verschenken. Ich habe beschlossen, Ihnen 1.50=
0.000,00 Euro zu spenden. Wenn Sie an meiner Spende interessiert sind, kont=
aktieren Sie mich f=FCr weitere Informationen.


Sie k=F6nnen auch mehr =FCber mich =FCber den unten stehenden Link lesen

https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe

Gesch=E4ftsf=FChrer Wipro Limited

Maria Elisabeth Schaeffler

E-Mail: mariaelisabethschaeffler70@gmail.com
