Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 030447427B4
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Jun 2023 15:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbjF2NuK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Jun 2023 09:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbjF2NuJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Jun 2023 09:50:09 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E24358A
        for <linux-tegra@vger.kernel.org>; Thu, 29 Jun 2023 06:50:08 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-635de6776bdso5823446d6.2
        for <linux-tegra@vger.kernel.org>; Thu, 29 Jun 2023 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688046608; x=1690638608;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEkw1KmmzfmMdZjy2G/k2kJ9Rp06l3CUoffIihDDUro=;
        b=I+l7OHIw73NwYClUW36DE/Rrfo4fY6jVN6Kt9U0osjx6iUI0+ASTMMdj24JYi0Xf9e
         swPYcIeKvK1mFM7eVK4xYVrlvi6beXBvz3bC5mfHao/b3JGYpFZ/JekqUtv8mAB0d/Ml
         MKYOmCYm519tzn39gwtoDFiH2nN6S6oJKouuyvrKWMaxMIcmu7uV7D6w6Lh96WCTr00U
         Hfxj8OZqd5s3JtsoO4QgZoHD1CsO+mIuEb1axKG3/2JYC19e6J5OzrG8JtD37NDLn3Oy
         kJtWFhFaouZVfi3GXGWTPmc91zlle/OHPJ6NRAKaHhENJPjj+wXu/x5N0JNJfb40cpbZ
         Fehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688046608; x=1690638608;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEkw1KmmzfmMdZjy2G/k2kJ9Rp06l3CUoffIihDDUro=;
        b=PzpRrkeN5L39Xtu6wfPEI4sUYqsKeMILiUXGCEJaPOdFVE3Borgb6bjqjPczoiJu60
         ZCO0dpv58GSzRs6425Nm3ztgsVn9ISonj/w3W3lJgkhq74QZ8UqVtedI3t/LP3HXYIGk
         ILLNxXx6s4E8VVMjrnMvKoUIqRdPOqYJhDzO8rDEPochttPn43NyKcqMaiG2Fz180oNM
         TFpGVC/FNuJYT4YRhfYNjsn+dcsaH8K7+snc5DQ4A9oZAZQTXmTQ8vDDOsOIKRySOd//
         BS2G5ROLO6IsOjhQzPSZUnhOJCjAZkzuZFem3OMDdOf3oPHyUxTiCL20s4oW0XEQlu9p
         AGyw==
X-Gm-Message-State: AC+VfDwMlJO+WzqaPnCgidM+UnmavBY/yVMiy8FHhjxHabozBRhivqdh
        NVcce7lRJaR9UQQGUAm2WlOONKLFaOYsGXaDZcw=
X-Google-Smtp-Source: ACHHUZ492CkMh71260s80yYHvmmy4MeTAy4qZaCtNhGmjTBJD4C8z9Zb8tIQr2rzpeCipF/f+3L4W9iH7KNy3+cXStk=
X-Received: by 2002:a05:6214:2466:b0:635:eff8:2b4c with SMTP id
 im6-20020a056214246600b00635eff82b4cmr8995461qvb.31.1688046607391; Thu, 29
 Jun 2023 06:50:07 -0700 (PDT)
MIME-Version: 1.0
Sender: abusalam777667@gmail.com
Received: by 2002:a05:6214:85:b0:635:52d9:3cfc with HTTP; Thu, 29 Jun 2023
 06:50:06 -0700 (PDT)
From:   AVA SMITH <avasmith1181@gmail.com>
Date:   Thu, 29 Jun 2023 13:50:06 +0000
X-Google-Sender-Auth: 8F8i3Dk8bCTYCkz3X0Yi23SEtMk
Message-ID: <CALikq9gusWTMuUE139HRZYBRYezgdbBX46fAFvjocU3vc5LkDw@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,
My name is Dr Ava Smith,a medical doctor from United States.I have
Dual citizenship which is English and French.I will share more details
about me as soon as i get a response from you.

Thanks
Ava
