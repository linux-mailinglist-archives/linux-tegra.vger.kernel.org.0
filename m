Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE74D4EB5CD
	for <lists+linux-tegra@lfdr.de>; Wed, 30 Mar 2022 00:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236569AbiC2WV1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 29 Mar 2022 18:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236743AbiC2WVR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Mar 2022 18:21:17 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6FA43395
        for <linux-tegra@vger.kernel.org>; Tue, 29 Mar 2022 15:19:34 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id w4so26722594wrg.12
        for <linux-tegra@vger.kernel.org>; Tue, 29 Mar 2022 15:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=TmleY20XwYnrKRNlot2CHP+vHjlJZkFZz+StuaKFepNgo/MZX1UmVZM/B5DTHl0Yi+
         X4VpRPI5fU5h8t2hGc0D8M3gRF0BW43k//R6f82OnEuPtQUFaD2exyqEyk55qQSzAbQC
         B7PrYAIHrUPdNn/4QouJM9GU39OVL2Rs6DuJwwjvPix2SFHlafFh1VuMEyTZCtos8jCt
         SztlQFKyv4gNP+5fvc1v2woGBQf9uvRsF+yXiXCVvz0vWtYDN/1N+b9uT8ub58wAqKqT
         NHew1rmRZMhILw+Lj4xhE+GvGsKWJ6VxrOqd/dYhOPYnnDkjEplGcQ8ID3PDM7CBFXnS
         /zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=gaZeQKgWLqrhYM3iabPlZSjkObgxkLBdeOXlm+g/SOxSfL13ndJMyJsjerHj9RHEel
         3QihzdX6M/OrhpLfOPTToGv+zlcxH5HEsjgH1bw9YSngAtYNKZNaqP4vFpUThUM0dw8R
         Cb3TZ3rikmI9huqbesqDgrwGvKsaH52nD2ecLzPWVOo11w1polwFSXCW3tR1Jyr98vBq
         tecp53H+75m7C3WzQCK0Uv4qsbkBOOhmToglav7Q0DVexD50PV0GWSXQiahd6Ewzw/E2
         hxH0YJNX+GR6ymF85ZiQQh693TXkH7keh1MN/1aDQVWRdo5p6CHMm8vVwQfrWYD3X/kH
         9cFQ==
X-Gm-Message-State: AOAM532+VigjmMYtcezhm/7kzjVUMPf+7V0DmdPLE8CgByyUZP0WA2Qm
        GycT3XeUiFRjq3xnpYB/9Ng=
X-Google-Smtp-Source: ABdhPJwhbjZTnFXwPg0qCG/hbrV7g5Hcev7qD9GX1/jsr1UJwrmczCG6mAaCh7yY2aUltAFp+k87HQ==
X-Received: by 2002:a5d:584a:0:b0:205:86cb:dd0e with SMTP id i10-20020a5d584a000000b0020586cbdd0emr32985384wrf.578.1648592372733;
        Tue, 29 Mar 2022 15:19:32 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.172])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c4ed100b0038ca32d0f26sm3545064wmq.17.2022.03.29.15.19.26
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:19:31 -0700 (PDT)
Message-ID: <624385f3.1c69fb81.545b4.ec4b@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:19:17 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
