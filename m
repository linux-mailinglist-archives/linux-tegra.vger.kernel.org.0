Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDDE52F460
	for <lists+linux-tegra@lfdr.de>; Fri, 20 May 2022 22:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236143AbiETU3C (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 May 2022 16:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235703AbiETU3A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 May 2022 16:29:00 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72FE17B871
        for <linux-tegra@vger.kernel.org>; Fri, 20 May 2022 13:28:59 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id i68so7051260qke.11
        for <linux-tegra@vger.kernel.org>; Fri, 20 May 2022 13:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=i6xMK++mmM+TiGw1Yu9D1e/PAPav5fx/fmhubwNzC3g=;
        b=H7+1w0Nr1S/nYwd7ED8w7/KhLVD7cauvbgMVmchoHsVfDLzITTHP0IawC8hWp9gp6+
         osK/wr0tjQ7iNW4tCaVf7cMOXDBRrZo5o9bNUTkj1wt6q2zLnLu7Rxij2VqcRWAA1mVj
         0rBkgsxhiSqzpPNHh260eRRN8r+MI2/irDqLcfKmAYpwaSoq6Cb6smwndvVcasRJuHFH
         vqTGN+tC0hLpCdKv5eFN2jzD7X2GGHq/yKzpClXQbItQPv+E+G7498bWPfC9767ouKKv
         xj0IqhIXholkM3HOeGtbx9Ived8bQcBWE5Eg3MZ1c4bXXNrym4s5+yaJQU/vr2emHQBa
         QhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=i6xMK++mmM+TiGw1Yu9D1e/PAPav5fx/fmhubwNzC3g=;
        b=SPXQF0b3WH4MfXKlfdyhJH+p7Hp472YUBeWo2Ryg7JJxJkt1i6gpaXdbmlXI00RXLO
         zZ5cQN0VtUkEpPrhV6sFzE0lzIV2w9IFTPMuwSiPCLjlH/TriUpBBNzH8lRBk7uuNYuM
         g4MILlWhekKuKxMq0+M6nt/PYeTDaQiHpQN3o7/5kLeM6Bn7z7sWma6LUW764Vbo/VLx
         KksRC7aEEC55unXEUDzQk022cOami0wlhuQdRhgMUMElmdo2N8dFxr2TZmye+ajhbbC6
         t3q048BUIBwsbu5/2hfRqnpeE/MncSZD1aJ1It9bug2OMgx8RglwlPxP2CziuSgsL6RS
         l54g==
X-Gm-Message-State: AOAM530I+QY8hACz5W4lxTYVKid/IC8fzv+79O26qnzhbmIrHc+2rlsx
        KRQecP+eoigkMtSp9i3JrAm8gG+mfNqJ9DNCBQU=
X-Google-Smtp-Source: ABdhPJwpBis0jkyEAdRV8UBd1JvkOR8qy6kmPQ1Hl6zSvULWjWC6WBS1tdPirW5P1MrUIWjSey1A/CcmbMNYUAC3U30=
X-Received: by 2002:a05:620a:12c4:b0:6a3:5396:624d with SMTP id
 e4-20020a05620a12c400b006a35396624dmr2128683qkl.665.1653078538877; Fri, 20
 May 2022 13:28:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:622a:1aa3:0:0:0:0 with HTTP; Fri, 20 May 2022 13:28:58
 -0700 (PDT)
From:   mary brown <marybrownloanfirm@gmail.com>
Date:   Fri, 20 May 2022 13:28:58 -0700
Message-ID: <CAKDBaZVLBayv_2=Fuoa4NDQVdTmpw_xR1twB-4g5hdFi64a1Rg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

-- 
Attn: do you need a loan?
