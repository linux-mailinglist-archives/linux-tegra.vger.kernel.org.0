Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90570774223
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Aug 2023 19:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbjHHRfz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 8 Aug 2023 13:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbjHHRfB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Aug 2023 13:35:01 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F6D222EA
        for <linux-tegra@vger.kernel.org>; Tue,  8 Aug 2023 09:15:14 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d479d128596so4859023276.1
        for <linux-tegra@vger.kernel.org>; Tue, 08 Aug 2023 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691511301; x=1692116101;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qOfFsSbynlfXPrF7I7PbxlQtAMXMz+YiBUY4VsKeUw=;
        b=nDwwxlq5tSMHKlbkrareLf3z948hl373opJRoxnC6bXcMv2pjb5NmnIQFvopcj6nNx
         Bu58MXrI5WydtFOcOrIM/YlEP9LzpCS5RjfCEYWwu58EIG7QJqW3DJubwB/OlbPvaDyS
         ajMrNiL1ZsiBlVMerOE5eEfzXNNg9vxUgOPgyeZsKHQ40ZO7t2DCLuTkTxUNHA3IGjkV
         6G+RiYrQggY0S3e/CVyROf3QLdLMoPeOpSAbj4eb1K481NdsKgQwqy3Bc+X7od1bptZb
         OWQwBTpIBeIFoIVFCL0sAUf900KMyg4Y4BJyES6gp63pythnUgOfnhZprd4RXGWkbFS7
         efeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511301; x=1692116101;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qOfFsSbynlfXPrF7I7PbxlQtAMXMz+YiBUY4VsKeUw=;
        b=jIrms2Z2peuB90i+RcVjwt/KIYkRkBvlUI0KMqhqZ7P0VdDkaCrwqAZyqbHfcHaI+o
         2ZyYwSyO75b/bJr5ygkzK8j/2ZRwkd2TmlxMB3FHNR7DUEYu30VsHyGXAsgRB4GswA+t
         vhXvifqsn117W81lAig3IDHD90C2lo3u7Pc1B4i/zarXtY6W8cFkj01eKzCHeoYJ/2pz
         usjicl1Ad/NJAZJ/ypH+NjzHIGHi3cDx7HI4z81SXdihw5B9w69IdwnmupcQ2dxb73Z9
         n8NV7a/9uOko5rbo5VSBVLZ+wFnXqNdt17+zfLr+4dta8gfbJZPOxBw3IwJOhhZtuUZA
         B8yg==
X-Gm-Message-State: AOJu0YwY94Lmx37C7JXbDkVJlNc3j2SZwOdglFj9rp8yO70/FM3qm7Ga
        s+TOj+K67bjTTatNju2XH7+jeMn6u2+vXwT861jGbzuen+nf2g==
X-Google-Smtp-Source: AGHT+IH6k0a2wId8BsYjjbBo9+8Cdgi8rEYu3siLgvVxauH40UhqVqcN8HHSNun6Jj96HNdnjiqLY2Iysp1qPFqFC3Y=
X-Received: by 2002:a25:a4e5:0:b0:d2b:1545:22fa with SMTP id
 g92-20020a25a4e5000000b00d2b154522famr10841686ybi.3.1691494162155; Tue, 08
 Aug 2023 04:29:22 -0700 (PDT)
MIME-Version: 1.0
Sender: aishaqaddafi808@gmail.com
Received: by 2002:a05:7108:3a85:b0:30d:f8cf:a5c1 with HTTP; Tue, 8 Aug 2023
 04:29:21 -0700 (PDT)
From:   Wolfgang Hermann Triebsch <hermanntriebschwolfgang@gmail.com>
Date:   Tue, 8 Aug 2023 03:29:21 -0800
X-Google-Sender-Auth: JcKWjCQTT2HpuAnmOFJWqkFNXlQ
Message-ID: <CABqmSjKT6eFyXAoTdj8hBR8wCZoWbOcnnmXDYzOqdv1xx7uVYA@mail.gmail.com>
Subject: Good Day My Beloved,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_5,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:b2e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [aishaqaddafi808[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  1.6 DATE_IN_PAST_03_06 Date: is 3 to 6 hours before Received: date
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [aishaqaddafi808[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

I am Mr Wolfgang Hermann Triebsch, a dua Citizen of Germany and
Canada, but living in Burkina Faso. I am 72 years old, I lost my wife
and two daughters during the Burkina Faso Political unrest that
happened in August 2016.

I am a philanthropist and a God fearing devoted Christian, a Crude Oil
dealer and Architecture.

Due to the shock of their death that resulted in me being diagnosed
with High Blood Pressure (HBP) also with Paralysis.

I cannot walk or stand, I have been bedridden for (4) years now,
recently I was diagnosed with Prostate Cancer, and I have concluded
that I will donate all my savings to charities and churches.

Since I know that I have very limited time to stay on earth before I
die according to my Doctors, I have been helping and contributing some
amounts of money to Orphanage Homes and to Charity Organizations, as
well as Foundations with the help of the Priest of the Catholic church
where i worship, I have given donations to over 10 Charity
Organizations and Foundations, in Africa, Asia, South America, etc. at
this moment I have the balance deposit sum of $7,000,000,00 USD,  in
one of the prime bank here in Burkina Faso which I want to entrust in
you or your church or your foundation for charity project in your
country with my name.
As soon as I receive your reply (hermanntriebschwolfgang@gmail.com) I
shall give you the contact of my bank where you will send your bank
details and other requirements they may need from you .I want you and
the church to always pray for me. Thanks for your understanding.

Best regards,
Mr. Wolfgang Hermann Triebsch.
