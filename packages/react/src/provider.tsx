import { NhostSession } from '@nhost/core'
import { NhostClient } from '@nhost/nhost-js'
import { useInterpret } from '@xstate/react'
import React, { createContext, PropsWithChildren, useEffect, useRef } from 'react'

export const NhostReactContext = createContext<NhostClient>({} as NhostClient)
export interface NhostReactProviderProps {
  nhost: NhostClient
  initial?: NhostSession
}

export const NhostReactProvider: React.FC<PropsWithChildren<NhostReactProviderProps>> = ({
  nhost,
  initial,
  ...props
}) => {
  const interpreter = useInterpret(nhost.auth.client.machine, { devTools: nhost.devTools })

  nhost.auth.client.start({ interpreter, initial, devTools: nhost.devTools })

  // * Hook to send session update everytime the 'initial' props changed
  const isInitialMount = useRef(true)
  useEffect(() => {
    if (isInitialMount.current) {
      isInitialMount.current = false
    } else {
      if (initial) {
        interpreter.send('SESSION_UPDATE', { data: { session: initial } })
      }
    }
  }, [initial, interpreter])

  return <NhostReactContext.Provider value={nhost}>{props.children}</NhostReactContext.Provider>
}
