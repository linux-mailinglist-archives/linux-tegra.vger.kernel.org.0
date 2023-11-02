Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA847DF437
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Nov 2023 14:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376635AbjKBNp5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 Nov 2023 09:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376646AbjKBNp4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Nov 2023 09:45:56 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC152185
        for <linux-tegra@vger.kernel.org>; Thu,  2 Nov 2023 06:45:51 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-28094a3b760so888349a91.3
        for <linux-tegra@vger.kernel.org>; Thu, 02 Nov 2023 06:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698932751; x=1699537551; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1w+j/4c/1BFWl/3h59aajp4r9v+fftTqF3noyIrajI=;
        b=RAlIm4+UhWpj7JZpWqn5xTcfPY8N73NRpI+Hg+pnV9VRwIau4b3UVCg17yV4pX6SHC
         nYxljPN43A+xOImm76iNJn/P4Kg4rusIiqXdpYR8PcXoK/1rHRIkeKtipCD3V2XhkcFR
         4RFpbMdiawetqGqv42xuN57RDsVtfnVRURP3EeJfC+9JJZwerB3eHowmdjpnyQT4uGcQ
         DrOKgEqr2/gNnI1snViQ7pc16PNI7jEecbeBXLuw1WAFWj0U21IX9oYUMO+QFqJJeaJW
         iB2HLd+Y9Cr0LJ7ubqkSDtod61j8WPDrKcsuguKa4Lc7IP6K0F7ZZArVZR7Vp0pbFA+s
         WpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698932751; x=1699537551;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1w+j/4c/1BFWl/3h59aajp4r9v+fftTqF3noyIrajI=;
        b=gXp2OQ73ZmtIuw0WkCNb6/AhaSRsl+t9ltkX7RaucRjJhDlyV+MyPXv1Mj0XpGBaJ9
         Yoeonl3QE3uWeBi6KoD6Qx3kwqh30VCa/spbHAntPvm36fUb3sX89bSOzY89DC+2Suy1
         we6iMCaQbwQ9KPmAQ0S1q9ZBfl7OtJxt8JvX6xb9DlC+lYJAIPLpbOOAwmLgCXkF7NMu
         dpjtpy/FRspzIH0vz6Mzbir4lsqHy9mLDBA2ECmjRv3oOTNr6Qr61GeETldXneKvlW2d
         sDkWDaIlp4RRB1b3am4zxI00WU09HjfVraw6hlPoNL7B3Qs+3RlckT+vivD33pTDQp/c
         Ar7g==
X-Gm-Message-State: AOJu0Yxs4YB3ljMr6tbB+lZJtUtKxmsEYXzBUciL+dbIfHXswxdOhctA
        fFhJ66pgBLqrGXufQq4l7QraFkWNnLejQHdN1oU=
X-Google-Smtp-Source: AGHT+IHIXCUproZIaJLikjwkqIYCA9kUqszQk9ZiFzyA0uHUJ/xlT24hZx1MA4Dw2U8oGDyhNI97sP0voUBqTExeKmc=
X-Received: by 2002:a17:90b:255:b0:27d:dc9:c67d with SMTP id
 fz21-20020a17090b025500b0027d0dc9c67dmr15264738pjb.36.1698932751209; Thu, 02
 Nov 2023 06:45:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:92b:b0:6e:e303:a059 with HTTP; Thu, 2 Nov 2023
 06:45:50 -0700 (PDT)
Reply-To: oj616414@gmail.com
From:   johnson pattaego <alidjiman00229@gmail.com>
Date:   Thu, 2 Nov 2023 13:45:50 +0000
Message-ID: <CAECK7Aa=WT9dRXsqTujDKcCZituDL=nR74xTefsP_Pm8gp-Uaw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

=C3=9Cdv=C3=B6zl=C3=B6m, van egy v=C3=A1llalkoz=C3=A1som, amelyre =C3=BAgy =
hivatkoztam r=C3=A1d, mint
neked   ugyanaz a vezet=C3=A9kn=C3=A9v, mint a n=C3=A9hai =C3=BCgyfelem, de=
 a r=C3=A9szletek az
al=C3=A1bbiak lesznek =C3=A9rtes=C3=ADtj=C3=BCk =C3=96nt, amikor meger=C5=
=91s=C3=ADti ennek az e-mailnek
a k=C3=A9zhezv=C3=A9tel=C3=A9t. =C3=9Cdv=C3=B6zlettel,
