Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCEB64C05B8
	for <lists+linux-tegra@lfdr.de>; Wed, 23 Feb 2022 01:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbiBWAEE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 22 Feb 2022 19:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbiBWAED (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Feb 2022 19:04:03 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E639344D6
        for <linux-tegra@vger.kernel.org>; Tue, 22 Feb 2022 16:03:37 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id n25-20020a05600c3b9900b00380f41e51e6so105479wms.2
        for <linux-tegra@vger.kernel.org>; Tue, 22 Feb 2022 16:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=eaaB5Fi4OIw8X99OdVt3/5VwsoSH3pqqZ03p7mumtcE=;
        b=X0wlXTgbDqKxZnfCLgREyrZx7ckdA+3HZZ1x3z/nOSpFZcSlefi0zQ6F+dGTRB5txd
         q0K9SVdF3OYT/f5dqCPhaeKDG7Z9p8v6peps6G18hMGH+IWJ+4isBJnw/s3qckknyc/4
         GMdswr1IThpmbH5CLuMK/6obUplfIVXSnJ1UK96Ab2m0yvKvJzg+zLEjeTyLKQVm2na3
         uMJVmGW9JoVK7s41DLSbv4Ea7f0O2N8acw2olJtd8pvY+3zfZoMHThCbFO4YwBEX+6Jz
         wkw11BsX4j+oKLZgZe94035LV3i8YIbbocWKu8aHHJkBtB0faRFUXlcwZpHUIdCTmXdn
         aUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=eaaB5Fi4OIw8X99OdVt3/5VwsoSH3pqqZ03p7mumtcE=;
        b=WaboBZOzjMu2+cmCK49HgQo+kyvRlzE6SoSp1cKOUFjsuEjKU6dTGPNvZnbdaYPY80
         YOcUvexg6su7rbD1d62XfUpOhTXwHSulgD+RRGTuLzKu+xik3nJ/fF0ihbdWHLfrZw+R
         FN4tPttLi3JzJIp0/8Zm5H9ASKnxcD0aY+WMU4PNIu5r6odrPX4YhRrX9nXbo2z4BxQe
         E9U1wPvvRn9z3frBwQzCLshJTS2W89QP5bnaEHjFWBkyPMOQJn9Iyfhc+JLAx8B22eSx
         PvQjKdvT74psG/Zz5w0ICCTzZnGJSXh9Jsn1whhmyzg1iW4esRPyUX+zs9KHT2VIhWsw
         yjfg==
X-Gm-Message-State: AOAM530wOmxr/Pu4yT3bNEjb1nM/FIgIzy6Gb2t7wHxTJer+RqiAdkYr
        Hh62Uvv6kg/dhnun4nErwMI=
X-Google-Smtp-Source: ABdhPJzVSokHh4nL1KALpewcSNxYeEGs9+ZGBHRcYM9tWPWARqIYLcQqgwnpgaEGobr5pSOunLKiaw==
X-Received: by 2002:a05:600c:1e0e:b0:37c:6c82:72a6 with SMTP id ay14-20020a05600c1e0e00b0037c6c8272a6mr5223046wmb.35.1645574616181;
        Tue, 22 Feb 2022 16:03:36 -0800 (PST)
Received: from [192.168.0.133] ([5.193.8.34])
        by smtp.gmail.com with ESMTPSA id f13sm36534051wri.82.2022.02.22.16.03.32
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Feb 2022 16:03:35 -0800 (PST)
Message-ID: <621579d7.1c69fb81.2449a.01a7@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <margaretdonation@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <Mrs@vger.kernel.org>
Date:   Wed, 23 Feb 2022 04:03:28 +0400
Reply-To: elisabethschaeffler01@gmail.com
X-Spam-Status: No, score=2.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,TO_MALFORMED,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hallo,

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen zu geben
der Rest von 25% geht dieses Jahr 2021 an Einzelpersonen. Ich habe mich ent=
schlossen, Ihnen 1.500.000,00 Euro zu spenden. Wenn Sie an meiner Spende in=
teressiert sind, kontaktieren Sie mich f=FCr weitere Informationen.

Sie k=F6nnen auch =FCber den untenstehenden Link mehr =FCber mich lesen


https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
Email: elisabethschaeffler01@gmail.com
