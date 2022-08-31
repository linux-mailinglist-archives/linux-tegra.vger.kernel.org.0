Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACF795A7DF0
	for <lists+linux-tegra@lfdr.de>; Wed, 31 Aug 2022 14:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiHaMvH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 31 Aug 2022 08:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbiHaMu5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Aug 2022 08:50:57 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD499DBE
        for <linux-tegra@vger.kernel.org>; Wed, 31 Aug 2022 05:50:55 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id z3-20020a17090abd8300b001fd803e34f1so12367501pjr.1
        for <linux-tegra@vger.kernel.org>; Wed, 31 Aug 2022 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=DnjnZSajfNgAzpK5ym8unXyyAyM+qS8cquz4gOGGtuU=;
        b=G3fCKAoY8Y+BL4Kthpcb0Egr9/mFUi1rRTc0KbpDeKgciOMID5qosSAB70JaIb1jYt
         /vyB+nvA2DCoMmVNzSdR2edlO5oS97DJfteMIQbh7UMQz+VzDks6jCUWiUgGqAtYlY0f
         x4/Qhso2JUnGhROUg659Eyb/u9vCQChHn2wnYbodqhoXGm7ecI2Djash8UCu64oy0+LR
         DV3MtluNga+qD/c5f+vytwY7mUjDXGKMNGYVTPw4WW19EoRPGHR+WnqSuJO2MM6486qb
         cDTv1kY91wD00lrv/8K6laSbKYkFPmhk2K5ZfM2d9dkZ3ecrjtpNbSa8j/2n52vRUfUp
         Ts7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DnjnZSajfNgAzpK5ym8unXyyAyM+qS8cquz4gOGGtuU=;
        b=Lfo2RIC1rEHwASt/OkJO0BTfFnWtKQUkZ6IkXJjxLmAtb6YHvlXAytQjDwZTwXVBzr
         25XMs5zDE1/ZMsk4EjLExHcc4IRcWMGYf9UkZYa6nw+cYriIR/sv+J419+ORnnjXFpLB
         E1f04y/5MOI7Xok+9MAblGe6PDAOEIds2sr/ZJ7Qk+hMEORTnj+MOD4cUiDAi5U3m/WM
         TO18Aax4MzKPb6C3gdowS4Qvtu0xr7k56q6sUZtnwNX0WxxuE7GCrDgNdqBl42AN+dLo
         OV/fT/VwP19MFa+uHFN0tJ9lUTkgbxbpTRxlXvIbkPvJsdOUVCUUKZ/6DZ4qt7vUmD+1
         oYLg==
X-Gm-Message-State: ACgBeo0EuJ/K2rgMoMzbHwN9zUVNM84rEL1otJfJ0OHgYcSGJR8vmLXO
        dQNNjDNjiU/6rFs5t+2m5CbUFzEdWtbZpMT7J58=
X-Google-Smtp-Source: AA6agR4Vz2e6efaNwm6X7LZebwjvnM7jBXf0nWRvGzSKAByp7c8onT+MNWwZ9+JUwWQHFLjGjw+2B3KZDPKwufynUjQ=
X-Received: by 2002:a17:90a:4d8d:b0:1fa:9cc6:3408 with SMTP id
 m13-20020a17090a4d8d00b001fa9cc63408mr3019180pjh.245.1661950255000; Wed, 31
 Aug 2022 05:50:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:522:47d8:b0:463:2ec4:9f82 with HTTP; Wed, 31 Aug 2022
 05:50:54 -0700 (PDT)
Reply-To: golsonfinancial@gmail.com
From:   OLSON FINANCIAL <fatimaaminu965@gmail.com>
Date:   Wed, 31 Aug 2022 05:50:54 -0700
Message-ID: <CAD2FrnoZCVm=a4HF+uEfeRR5kg1K7wTybRRM8PGDvRotfLPJmQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1029 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [fatimaaminu965[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fatimaaminu965[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--=20
Hallo Gr=C3=BC=C3=9Fe,
Ben=C3=B6tigen Sie dringend einen Kredit, um ein Haus oder ein Auto zu
kaufen? oder ben=C3=B6tigen Sie ein Gesch=C3=A4fts- oder Privatdarlehen, um=
 zu
investieren? ein neues Gesch=C3=A4ft er=C3=B6ffnen, Rechnungen bezahlen? Un=
d
zahlen Sie uns Installationen zur=C3=BCck? Wir sind ein zertifiziertes
Finanzunternehmen. Wir bieten Privatpersonen und Unternehmen Kredite
an. Wir bieten zuverl=C3=A4ssige Kredite zu einem sehr niedrigen Zinssatz
von 2 %. F=C3=BCr weitere Informationen
mailen Sie uns an: golsonfinancial@gmail.com..
